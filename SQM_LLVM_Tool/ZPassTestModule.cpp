//===-- ZPassTestModule.cpp - Example Transformations --------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/ZPassTestModule/ZPassTestModule.h"
// brackets for standard library stuff, quotes for everything else
#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/InstIterator.h"
// WARNING: THIS INCLUDE IS OUTDATED
// on more modern LLVM, the stuff I used from Local.h is in DebugInfo.h!
// FindDbgDeclareUses
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/Support/FormatVariadic.h""
// C++17 or higher required
#include <filesystem>
#include <iostream>
#include <fstream>

using namespace llvm;

// node struct for making finding unique types a bit easier
class nodeSQM {
private:
  static int nodeCount;
  static std::vector<nodeSQM> nodeVec;
  static std::string currentPath;

public:
  int numericID;
  std::string nodeIdentifier;
  std::string name;
  std::string filename;
  int lineNumber;
  int columnNumber;

  nodeSQM() {
    this->numericID = -1;
    this->nodeIdentifier = "--";
    this->name = "--";
    this->filename = "--";
    this->lineNumber = -1;
    this->columnNumber = -1;
  }

  // default (& therefore erased) line and column may want to be 0 instead
  nodeSQM(StringRef nodeIdentifier, StringRef name = "--",
          StringRef filename = "--", int lineNumber = 0, int columnNumber = 0) {
    this->numericID = nodeCount++;
    this->nodeIdentifier = nodeIdentifier.str();
    this->name = name.empty() ? "--" : name.str();
    this->filename = filename.empty() ? "--" : filename.str();
    this->lineNumber = lineNumber;
    this->columnNumber = columnNumber;
  }

  nodeSQM(StringRef nodeIdentifier, DIScope *debugThing, int lineNumber = 0,
          int columnNumber = 0)
      : nodeSQM(nodeIdentifier, debugThing->getName(),
                debugThing->getFilename(), lineNumber, columnNumber) {}

  bool isEmpty() {
    if (this->numericID == -1 && this->nodeIdentifier == "--" &&
        this->name == "--" && this->filename == "--" &&
        this->lineNumber == -1 && this->columnNumber == -1) {
      return true;
    }
    return false;
  }

  friend std::ostream &operator<<(std::ostream &out, nodeSQM const &node);
  friend llvm::raw_fd_ostream &operator<<(llvm::raw_fd_ostream &out,
                                          nodeSQM const &node);
  friend bool operator==(const nodeSQM &lhs, const nodeSQM &rhs);
  friend nodeSQM addUniqueNewNode(nodeSQM newNodeIn);
  static std::vector<nodeSQM> getNodeVec() { return nodeVec; }
  static std::string getCurrentPath() { return currentPath; }
};

std::ostream &operator<<(std::ostream &out,
                                 nodeSQM const &node) {
  std::string located = "--";
  if (node.lineNumber > 0) {
    located = formatv("({0})", node.lineNumber);
    if (node.columnNumber > 0) {
      located = formatv("({0}:{1})", node.lineNumber, node.columnNumber);
    }
  }
  std::string output =
      formatv("Node    {0,-3} {1,-7} {2,-7} {3,-20} {4}", node.numericID,
              node.nodeIdentifier, node.name, node.filename, located);
  out << output;
  return out;
}

llvm::raw_fd_ostream &operator<<(llvm::raw_fd_ostream &out, nodeSQM const &node) {
  std::string located = "--";
  if (node.lineNumber > 0) {
    located = formatv("({0})", node.lineNumber);
    if (node.columnNumber > 0) {
      located = formatv("({0}:{1})", node.lineNumber, node.columnNumber);
    }
  }
  std::string output = formatv("Node    {0,-3} {1,-7} {2,-7} {3,-20} {4}", node.numericID, node.nodeIdentifier, node.name, node.filename, located);
  out << output;
  return out;
}

// Not sure if ForInitial is a scope or a field
// DANGER: GLOBAL
// TODO: ask!
const std::string scopesSQM[] = {"Scope",      "CatchScope", "ElseScope",
                                 "Finally",    "ForInitial", "MethodScope",
                                 "RightScope", "Then",       "TryScope",
                                 "Try_Catch",  "WrongScope"};

bool operator==(const nodeSQM &lhs, const nodeSQM &rhs) {
    // numericID not included since we are mainly using this to keep track of that

    // this bit is so we can easily convert generic Scope nodes into more specific nodes if they match up
    // the other "half" of this code is in addUniqueNode
  
  auto lhSearch = std::find(std::begin(scopesSQM), std::end(scopesSQM), lhs.nodeIdentifier);
  auto rhSearch = std::find(std::begin(scopesSQM), std::end(scopesSQM), rhs.nodeIdentifier);
  if ((lhs.nodeIdentifier == "Scope" && rhSearch != std::end(scopesSQM)) ||
      (rhs.nodeIdentifier == "Scope" && lhSearch != std::end(scopesSQM))) {

    // MethodScope can't pick up column info, so ignore that when you've got a
    // MethodScope
    // TODO: maybe check this out a little more closely
    // this will break if you're doing crazy one-liner shit
    bool columnCheck = (lhs.nodeIdentifier == "MethodScope" ||
                        rhs.nodeIdentifier == "MethodScope")
                           ? true
                           : lhs.columnNumber == rhs.columnNumber;
    return lhs.name == rhs.name && lhs.filename == rhs.filename &&
           lhs.lineNumber == rhs.lineNumber && columnCheck;
  }

  return lhs.nodeIdentifier == rhs.nodeIdentifier && lhs.name == rhs.name &&
         lhs.filename == rhs.filename && lhs.lineNumber == rhs.lineNumber &&
         lhs.columnNumber == rhs.columnNumber;
}

// for future reference remember that functions copy vectors so you need a &
// reference if you want to modify the original directly
// returns the first node if not unique and the current node if it is
nodeSQM addUniqueNewNode(nodeSQM newNodeIn) {
  auto search =
      std::find(nodeSQM::nodeVec.begin(), nodeSQM::nodeVec.end(), newNodeIn);
  if (search != nodeSQM::nodeVec.end()) {
    // probably would be better to not need to do this but eeeehh......
    nodeSQM::nodeCount--;
    nodeSQM out = *search;
    // handle scope stuff - see also nodeSQM's operator==
    // the case where there are conflicting scopes and NEITHER is just a "Scope"
    // shouldn't ever occur the other scope types are identified on-the-spot in
    // relation to their specific circumstances but "Scope" can come from any
    // field or function it contains
    if (out.nodeIdentifier == "Scope" || newNodeIn.nodeIdentifier == "Scope") {
      // take the name of whichever isn't just a Scope
      std::string nodeIdentifier = (out.nodeIdentifier == "Scope")
                                       ? newNodeIn.nodeIdentifier
                                       : out.nodeIdentifier;
      nodeSQM older = out;
      out.nodeIdentifier = nodeIdentifier;
      std::replace(nodeSQM::nodeVec.begin(), nodeSQM::nodeVec.end(), older,
                   out);
    }
    return out;
  } else {
    nodeSQM::nodeVec.push_back(newNodeIn);
    //errs() << newNodeIn << "\n";
    return newNodeIn;
  }
}

nodeSQM addUniqueNewNode(StringRef nodeIdentifier, StringRef name = "--",
                         StringRef filename = "--", int lineNumber = 0,
                         int columnNumber = 0) {
  nodeSQM newNodeIn(nodeIdentifier, name, filename, lineNumber, columnNumber);
  return addUniqueNewNode(newNodeIn);
}

nodeSQM addUniqueNewNode(StringRef nodeIdentifier, DIScope *debugThing,
                         int lineNumber = 0, int columnNumber = 0) {
  nodeSQM newNodeIn(nodeIdentifier, debugThing, lineNumber, columnNumber);
  return addUniqueNewNode(newNodeIn);
}

class edgeSQM {
private:
  static std::vector<edgeSQM> edgeVec;

public:
  int nodeAID;
  int nodeBID;
  int statement;
  std::string edgeType;
  int weight;

  edgeSQM(int nodeAID, int nodeBID, int statement, std::string edgeType,
          int weight = 1) {
    this->nodeAID = nodeAID;
    this->nodeBID = nodeBID;
    this->statement = statement;
    this->edgeType = edgeType;
    this->weight = weight;
  }

  friend std::ostream &operator<<(std::ostream &out, edgeSQM const &edge);
  friend llvm::raw_fd_ostream &operator<<(llvm::raw_fd_ostream &out,
                                          edgeSQM const &edge);
  friend bool operator==(const edgeSQM &lhs, const edgeSQM &rhs);
  friend void addUniqueNewEdge(int nodeAID, int nodeBID, int statement,
                               std::string edgeType, int weight);
  static std::vector<edgeSQM> getEdgeVec() { return edgeVec; }
};

std::ostream &operator<<(std::ostream &out,
                                 edgeSQM const &edge) {
  std::string output =
      formatv("Edge    {0,-3} {1,-3} {2,-3} {3}  {4}", edge.nodeAID,
              edge.nodeBID, edge.statement, edge.edgeType, edge.weight);
  out << output;
  return out;
}

llvm::raw_fd_ostream &operator<<(llvm::raw_fd_ostream &out, edgeSQM const &edge) {
  std::string output = formatv("Edge    {0,-3} {1,-3} {2,-3} {3}  {4}",edge.nodeAID,edge.nodeBID,edge.statement,edge.edgeType,edge.weight);
  out << output;
  return out;
}

bool operator==(const edgeSQM &lhs, const edgeSQM &rhs) {
    // weight not included since it has no apparent function
  return lhs.nodeAID == rhs.nodeAID && lhs.nodeBID == rhs.nodeBID &&
         lhs.statement == rhs.statement && lhs.edgeType == rhs.edgeType;
}

void addUniqueNewEdge(int nodeAID, int nodeBID, int statement,
                      std::string edgeType, int weight = 1) {
  edgeSQM newEdgeIn(nodeAID, nodeBID, statement, edgeType, weight);
  auto search =
      std::find(edgeSQM::edgeVec.begin(), edgeSQM::edgeVec.end(), newEdgeIn);
  if (search == edgeSQM::edgeVec.end()) {
    //errs() << newEdgeIn << "\n";
    edgeSQM::edgeVec.push_back(newEdgeIn);
  } else {
    // for debug, essentially
    // not all edges should be unique, unfortunately!
    // are there particular edge types that can be uniqued every time?
    //errs() << "DUPLICATED EDGE\n";
    //errs() << newEdgeIn << "\n";
  }
}

// forward declarations
nodeSQM classFieldNodeGEP(GetElementPtrInst *GEP);
void definitionEdgeConnector(DIType *TN, nodeSQM uniqueFieldNode,
                             bool isSub = false);
nodeSQM subprogramNodeGenerator(DISubprogram *S);
nodeSQM typeNodeGenerator(DIType *T);

std::vector<nodeSQM> undefinedFunctionNodes(Function *F) {
  // first element is the function, subsequent elements are params
  std::vector<nodeSQM> undefinedFunctionNodesVec;

  nodeSQM functionNode = addUniqueNewNode("Method", F->getName(), "UNDEFINED");
  undefinedFunctionNodesVec.push_back(functionNode);

  std::string returnTypeString;
  raw_string_ostream rso(returnTypeString);
  F->getReturnType()->print(rso);
  returnTypeString = rso.str();

  nodeSQM returnTypeNode;

  if (returnTypeString != "void") {
    returnTypeNode = addUniqueNewNode(
        "TypeName",
        F->getName().str() + " UNDEFINED RETURN TYPE " + returnTypeString,
        "UNDEFINED");
  } else {
    returnTypeNode = addUniqueNewNode("TypeName", "void");
  }

  addUniqueNewEdge(functionNode.numericID, returnTypeNode.numericID, -1,
                   "ReturnType");

  for (int i = 0; i < F->arg_size(); i++) {
    nodeSQM parameterNode = addUniqueNewNode(
        "Parameter",
        F->getName().str() + " UNDEFINED PARAMETER " + std::to_string(i),
        "UNDEFINED");

    undefinedFunctionNodesVec.push_back(parameterNode);

    addUniqueNewEdge(functionNode.numericID, parameterNode.numericID,
                     functionNode.numericID, "FormalParameter");
    addUniqueNewEdge(parameterNode.numericID, functionNode.numericID,
                     functionNode.numericID, "MemberOf");

    std::string paramTypeString;
    raw_string_ostream rso(paramTypeString);
    F->getArg(i)->getType()->print(rso);
    paramTypeString = F->getName().str() + " UNDEFINED PARAMETER TYPE " + rso.str();

    nodeSQM typeNode =
        addUniqueNewNode("TypeName", paramTypeString, "UNDEFINED");
    addUniqueNewEdge(typeNode.numericID, parameterNode.numericID,
                     parameterNode.numericID, "DefinitionOf");
    addUniqueNewEdge(parameterNode.numericID, typeNode.numericID,
                     parameterNode.numericID, "InstanceOf");
  }

  return undefinedFunctionNodesVec;
}

// this is for making sure scopes are hooked up properly, in particular with respect to branches without curly brackets.
// this assumes that Instruction IB has a non-null getDebugLoc and that said getDebugLoc has a DILexicalBlock as a scope
nodeSQM branchScopeSpecifier(Instruction *IB) {
  // DANGER: this copies code from the BranchInst section

  BasicBlock *parentBlock = IB->getParent();
  Instruction *parentExit = &parentBlock->back();
  bool isLoop = false;
  for (User *U : parentBlock->users()) {
    if (BranchInst *UBI = dyn_cast<BranchInst>(U)) {
      if (UBI->hasMetadata(StringRef("llvm.loop"))) {
        isLoop = true;
      } else if (parentExit->hasMetadata(StringRef("llvm.loop"))) {
        isLoop = true;
      }
    }
  }

  if (!isLoop) {
    // this whole thing is for branch statements with no curly
    // brackets. it can be hard to keep track of if/else stuff
    // without those proper LLVM scopes.
    if (BasicBlock *parentPred = parentBlock->getSinglePredecessor()) {
      if (BranchInst *predExit = dyn_cast<BranchInst>(&parentPred->back())) {
        DILocation *parentLoc = predExit->getDebugLoc();
        if (predExit->isConditional()) {
          BasicBlock *BBThen = predExit->getSuccessor(0);
          Instruction *ThenInst = &BBThen->front();
          DILocation *ThenLoc = ThenInst->getDebugLoc();
          while (ThenLoc == NULL) {
            ThenInst = ThenInst->getNextNonDebugInstruction();
            ThenLoc = ThenInst->getDebugLoc();
          }
          BasicBlock *BBElse = predExit->getSuccessor(1);
          // TODO: can it be said that a size() == 1 successor means no ElseScope is possible? and thus things can be skipped?
          while (BBElse->size() == 1) {
            if (BranchInst *skippableBI =
                    dyn_cast<BranchInst>(&BBElse->front())) {
              if (skippableBI->isUnconditional()) {
                BBElse = skippableBI->getSuccessor(0);
              } else {
                break;
              }
            } else {
              break;
            }
          }
          Instruction *ElseInst;
          if (BBElse->size() == 1) {
              // for situations involving return statements
            ElseInst = &BBElse->back();
          } else {
            ElseInst = BBElse->back().getPrevNonDebugInstruction();
            if (ElseInst == NULL) {
              // if the previous instruction is a debug instruction
              ElseInst = &BBElse->back();
            }
          }
          DILocation *ElseLoc = ElseInst->getDebugLoc();
          while (ElseLoc == NULL) {
            ElseInst = ElseInst->getPrevNonDebugInstruction();
            ElseLoc = ElseInst->getDebugLoc();
          }
          for (int i = 0; i <= 1; i++) {
            // shouldn't need to deal with BBElse stuff?
            // since this process is dependent on the parent block's stuff
            if (predExit->getSuccessor(i) == parentBlock) {
              DILocation *branchedLoc = i ? ElseLoc : ThenLoc;
              if (parentLoc->getScope() ==
                  branchedLoc->getScope()->getScope()) {
                if (!i) {
                  // what we use as the "scope" is, in this
                  // case, the start of the single successor
                  // line (remember, no curlies to keep track)
                  branchedLoc = parentBlock->back().getDebugLoc();
                } else if (ElseLoc->getScope() != ThenLoc->getScope()) {
                  // under this specific set of circumstances,
                  // an ElseScope might be suspected but should
                  // not actually exist. for example, the else
                  // branch might point to another scope like
                  // a For3Loop's ForInitial or boolean
                  break;
                }
                return addUniqueNewNode(
                    "Scope", "--", branchedLoc->getFilename(),
                    branchedLoc->getLine(), branchedLoc->getColumn());
              }
            }
          }
        }
      }
    }
  }

  DILexicalBlock *LB = cast<DILexicalBlock>(IB->getDebugLoc()->getScope());

  return addUniqueNewNode("Scope", "--", LB->getFilename(), LB->getLine(),
                          LB->getColumn());
}

nodeSQM nonStringLiteralFinder(Instruction *I, Value *storeValue) {
  // TODO: figure out how to best connect literals to their types

  nodeSQM outputNode;

  if (DILocation *Loc = I->getDebugLoc()) {
    std::string outString = "";
    // THIS TBAA THING WILL BE IMPORTANT FOR SURE
    if (I->hasMetadata(StringRef("tbaa"))) {
      MDNode *accessTag = I->getMetadata(StringRef("tbaa"));
      MDNode *baseType = dyn_cast<MDNode>(accessTag->getOperand(0));
      MDString *typeString = dyn_cast<MDString>(baseType->getOperand(0));
      outString = (typeString->getString()).str();
    } else {
      if (CallBase *CB = dyn_cast<CallBase>(I)) {
        for (int i = 0; i < CB->getNumArgOperands(); i++) {
          if (CB->getArgOperand(i) == storeValue) {
            for (User *U : CB->getCalledFunction()->getArg(i)->users()) {
              if (Instruction *UI = dyn_cast<Instruction>(U)) {
                if (UI->hasMetadata(StringRef("tbaa"))) {
                  MDNode *accessTag = UI->getMetadata(StringRef("tbaa"));
                  MDNode *baseType = dyn_cast<MDNode>(accessTag->getOperand(0));
                  MDString *typeString =
                      dyn_cast<MDString>(baseType->getOperand(0));
                  outString = (typeString->getString()).str();
                  break;
                }
              }
            }
          }
        }
      }
    }

    std::string definitionName;
    if (ConstantFP *FP = dyn_cast<ConstantFP>(storeValue)) {
      // be aware of floating point precision errors...
      SmallString<32> floatVec;
      (FP->getValue()).toString(floatVec);
      outputNode = addUniqueNewNode("Literal", floatVec.str(), Loc->getFilename(),
                              Loc->getLine(), Loc->getColumn());
      // TODO: find a way to connect type edges to this...
      // doubles and floats alike!
      std::string type_str;
      raw_string_ostream rso(type_str);
      FP->getType()->print(rso);
      definitionName = rso.str();
    } else if (ConstantInt *CI = dyn_cast<ConstantInt>(storeValue)) {
      std::string literalString = (CI->getValue()).toString(10, true);
      // may want to chop out this if-else-if for something nicer...
      // TODO: figure out how to best connect literals to their types
      if (outString.find("char") != std::string::npos) {
          // TODO: escape special characters
        std::string charString(1, (char)stoi(literalString));
        literalString = charString;
        definitionName = "char";
      } else if (outString.find("bool") != std::string::npos ||
                 CI->getType()->isIntegerTy(1)) {
        literalString = stoi(literalString) ? "true" : "false";
        definitionName = "bool";
      } else {
        definitionName = "int";
      }
      outputNode = addUniqueNewNode("Literal", literalString, Loc->getFilename(),
                              Loc->getLine(), Loc->getColumn());
    } else if (ConstantPointerNull *CPN = dyn_cast<ConstantPointerNull>(storeValue)) {
      definitionName = "null";
      outputNode =
          addUniqueNewNode("Literal", "NULL", Loc->getFilename(),
                           Loc->getLine(), Loc->getColumn());
    }
    
    // TODO: figure out how to best connect literals to their types
    if (!outputNode.isEmpty()) {
      nodeSQM typeNode = addUniqueNewNode("TypeName", definitionName);

      addUniqueNewEdge(typeNode.numericID, outputNode.numericID,
                       outputNode.numericID, "DefinitionOf");
      addUniqueNewEdge(outputNode.numericID, typeNode.numericID,
                       outputNode.numericID, "InstanceOf");
    }
  }
  //if (!outputNode.isEmpty()) {
  //  errs() << outputNode << "\n";
  //}
  return outputNode;
}

nodeSQM stringLiteralFinder(Value *constExp, Instruction *IB) {
  nodeSQM outputNode;
  //errs() << "CONST\n";
  //constExp->dump();
  // get ConstantExprs - these hold string Literals
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(constExp)) {
    // pull the global variable out of the expression
    Value *op = CE->getOperand(0);
    GlobalVariable *G = dyn_cast<GlobalVariable>(op);
    //errs() << "GLOBAL\n";
    //G->dump();
    // get the initializer of the global
    if (ConstantDataArray *CDA =
            dyn_cast_or_null<ConstantDataArray>(G->getInitializer())) {
      // errs() << "CDA\n";
      // CDA->dump();
      // get node if there's a string
      if (CDA->isString()) {
        DILocation *Loc = IB->getDebugLoc();
        // this bit modifies the string for readability - this can
        // be removed if necessary: comment out the stuff before
        // the newNode and replace stringedArray with
        // CDA->getAsString()
        std::string stringedArray = (CDA->getAsString()).str();

        // rip out common escape sequences
        // got this off StackOverflow
        std::string replacer;
        replacer.reserve(stringedArray.size());
        for (const char c : stringedArray) {
          switch (c) {
          case '\'':
            replacer += "\\\'";
            break;
          case '\"':
            replacer += "\\\"";
            break;
          case '\?':
            replacer += "\\\?";
            break;
          case '\\':
            replacer += "\\\\";
            break;
          case '\a':
            replacer += "\\a";
            break;
          case '\b':
            replacer += "\\b";
            break;
          case '\f':
            replacer += "\\f";
            break;
          case '\n':
            replacer += "\\n";
            break;
          case '\r':
            replacer += "\\r";
            break;
          case '\t':
            replacer += "\\t";
            break;
          case '\v':
            replacer += "\\v";
            break;
          default:
            replacer += c;
            break;
          }
        }

        stringedArray = replacer;
        stringedArray.insert(0, "\"");
        stringedArray.insert(stringedArray.length() - 1, "\"");
        // removes null characters, via StackOverflow
        stringedArray.erase(
            std::find(stringedArray.begin(), stringedArray.end(), '\0'),
            stringedArray.end());

        outputNode =
            addUniqueNewNode("Literal", stringedArray, Loc->getFilename(),
                             Loc->getLine(), Loc->getColumn());

        // TODO: figure out how to best connect literals to their types
        // maybe just get the node named string from the nodes list...?
        // if (CallBase *CB = dyn_cast<CallBase>(IB)) {
        //  for (int i = 0; i < CB->getNumArgOperands(); i++) {
        //    if (CB->getArgOperand(i) == constExp) {
        //      //CB->getCalledFunction()->dump();
        //      CB->getCalledFunction()->getSubprogram()->dump();
        //      for (User *U : CB->getCalledFunction()->getArg(i)->users()) {
        //        if (StoreInst *SI = dyn_cast<StoreInst>(U)) {
        //          SI->dump();
        //          SI->getValueOperand()->dump();
        //        }
        //      }
        //    }
        //  }
        //}
      }
    }
  }
  
  return outputNode;
}

nodeSQM globalFieldFinder(GlobalVariable *GV) {
  // DANGER: COPIED FROM GLOBAL VARIABLE ITERATOR
  SmallVector<DIGlobalVariableExpression *> globalVec;
  GV->getDebugInfo(globalVec);
  // it's possible this for loop is unneeded
  // not sure whether or not this vector will ever contain more than 1 element
  for (DIGlobalVariableExpression *GVE : globalVec) {
    DIGlobalVariable *G = GVE->getVariable();
    // letting any fieldy globals come through for identification
    // if that's wrong, replace true with this:
    //G->getDirectory().find(nodeSQM::getCurrentPath()) != std::string::npos
    if (true) {
      return addUniqueNewNode("Field", G->getName(), G->getFilename(),
                              G->getLine());
    }
  }
}

// for identifying fields, parameters
nodeSQM fieldParameterFinder(Value *pointer) {
    // careful about this new thing: dig down another LoadInst
  if (LoadInst *LI = dyn_cast<LoadInst>(pointer)) {
      pointer = LI->getPointerOperand();
  }

  if (GlobalVariable *GV = dyn_cast<GlobalVariable>(pointer)) {
    return globalFieldFinder(GV);
  }

  for (auto uses : FindDbgDeclareUses(pointer)) {
    DILocalVariable *LV = uses->getVariable();
    if (!LV->isArtificial()) {
      if (LV->getArg() != 0) {
        return addUniqueNewNode("Parameter", LV->getName(), LV->getFilename(),
                                LV->getLine());
      } else {
        return addUniqueNewNode("Field", LV->getName(), LV->getFilename(),
                                LV->getLine());
      }
    }
  }
  if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(pointer)) {
    return classFieldNodeGEP(GEP);
  }
  nodeSQM emptyNode;
  return emptyNode;
}

// duplicated code turned into a function
// used in classFieldNodeGEP
nodeSQM GEPReadWrite(GetElementPtrInst *GEP, Value *pointOp, int indexOperand) {
  nodeSQM arrayField = fieldParameterFinder(pointOp);
  nodeSQM positionField;
  if (Instruction *targetValue =
          dyn_cast<Instruction>(GEP->getOperand(indexOperand))) {
    // TODO: find a way to get pos out of this and hook these things together
    if (LoadInst *LI = dyn_cast<LoadInst>(targetValue->getOperand(0))) {
      positionField = fieldParameterFinder(LI->getPointerOperand());
    }
  } else if (ConstantInt *arrayPos =
                 dyn_cast<ConstantInt>(GEP->getOperand(indexOperand))) {
    // problem: if you've got a hard-coded literal 0 as the position index of an
    // array, the GEP will have 0, 0 at the end. this is identical to, like, the
    // way the array is initialized? so there's no way to tell if such a literal
    // 0 is real and exists, or if it is being added because of the structure
    // itself.
    positionField = nonStringLiteralFinder(GEP, arrayPos);
  }
  if (!positionField.isEmpty() && !arrayField.isEmpty()) {
    nodeSQM scopeNode;
    DILocalScope *memberScope = GEP->getDebugLoc()->getScope();
    if (DILexicalBlock *LB = dyn_cast<DILexicalBlock>(memberScope)) {
      // DANGER: COPY
      // scopeNode = addUniqueNewNode("Scope", "--", LB->getFilename(),
      // LB->getLine(), LB->getColumn());
      scopeNode = branchScopeSpecifier(GEP);
    } else if (DISubprogram *SP = dyn_cast<DISubprogram>(memberScope)) {
      scopeNode = addUniqueNewNode("MethodScope", "--", SP->getFilename(),
                                   SP->getScopeLine());
    }

    addUniqueNewEdge(arrayField.numericID, positionField.numericID,
                     scopeNode.numericID, "WrittenBy");
    addUniqueNewEdge(positionField.numericID, arrayField.numericID,
                     scopeNode.numericID, "CandidateRead");
  }
  return arrayField;
}

// this is mainly for class methods and the like
// helps connect parameters to member fields of the relevant class
// however, it's also used for element access in arrays and the like
nodeSQM classFieldNodeGEP(GetElementPtrInst *GEP) {
  //errs() << "GEP!\n";
  //GEP->dump();
  // not sure if inbounds is strictly necessary but it shows up, so
  if (GEP->isInBounds()) {
    Value *pointOp = GEP->getPointerOperand();
    //pointOp->dump();
    // TODO: CastInsts
    // Some inheritancey stuff going on here...
    if (CastInst *CI = dyn_cast<CastInst>(pointOp)) {
      pointOp = CI->getOperand(0);
    }
    // this is strictly afwul
    // TODO: unfuck this
    // TODO: see when ~~this~~ is meant to be used
    //pointOp->dump();
    if (LoadInst *LI = dyn_cast<LoadInst>(pointOp)) {
      pointOp = LI->getPointerOperand();
    }
    //pointOp->dump();
    for (auto uses : FindDbgDeclareUses(pointOp)) {
      //uses->dump();
      //uses->getVariable()->dump();
      DIType *targetType = uses->getVariable()->getType();
      //targetType->dump();
      while (DIDerivedType *DT = dyn_cast<DIDerivedType>(targetType)) {
        if (DT->getBaseType() == NULL) {
          break;
        } else if (DT->getTag() == 15 && isa<DIBasicType>(DT->getBaseType())) {
          // a pointer to a basic type, such as *char
          break;
        } else {
          targetType = DT->getBaseType();
        }
      }
      //targetType->dump();

      // previously literal 2
      int indexOperand = GEP->getNumIndices();

      if (DIDerivedType *DT = dyn_cast<DIDerivedType>(targetType)) {
        return GEPReadWrite(GEP, pointOp, indexOperand);
      } else if (DICompositeType *CT = dyn_cast<DICompositeType>(targetType)) {
        // TODO: check if the type from the GEP is the same as CT
        // if not, check for Inheritance, and then drill until you hit the
        // GEP type
        // Holy FUCK this is horrendous!
        // TODO: search further for a less shit way to check this
        // or even better, find a way to cirumvent this entirely

        // I actually have no idea if this is the right thing to do
        // I needed a quick fix to get through part of the program so here's this
        // arrays and adding elements to arrays are poorly handled right now
        Type *sourceType = GEP->getSourceElementType();
        if (ArrayType *AT = dyn_cast<ArrayType>(sourceType)) {
          sourceType = AT->getArrayElementType();
        }

        if (isa<StructType>(sourceType)) {
          std::string sourceName = (sourceType->getStructName()).str();
          std::string typeNameAlone =
              sourceName.substr(sourceName.find(".") + 1);
          typeNameAlone =
              typeNameAlone.substr(0, typeNameAlone.find_last_of('.'));

          // errs() << CT->getName().str() << "\n";
          // errs() << typeNameAlone << "\n";
          // this while exists to help drill down into inheritance
          // TODO: test this more thoroughly, potentially DANGERous
          while (CT->getName().str().find(typeNameAlone) == std::string::npos) {
            if (DIDerivedType *inheritanceCheck =
                    dyn_cast_or_null<DIDerivedType>(CT->getElements()[0])) {
              if (inheritanceCheck->getTag() == 28) {
                CT = dyn_cast<DICompositeType>(inheritanceCheck->getBaseType());
              } else {
                break;
              }
            } else {
              // okay, so these breaks would usually not be necessary
              // under normal, expected circumstances, the struct/class name
              // matches the CT name
              // HOWEVER
              // LLVM will pull some spooky optimization nonsense
              // and rename/reassign struct/class types to other shit
              // if they are functionally identical
              // so, two completely different structs that both contain exactly
              // only two integers are considered to be the same thing and
              // optimized into one GREAT
              break;
            }
          }
        }

        if (CT->getTag() == 1 || CT->getTag() == 19) {
          return GEPReadWrite(GEP, pointOp, indexOperand);
        }

        // this i32 (operand 2) has the index of the member element
        int intPos =
            (cast<ConstantInt>(GEP->getOperand(indexOperand))->getValue())
                .getSExtValue();
        // TODO: there's a situation where intPos is wrong???
        // has to do with _vptrs???
        // idea: if the first member is artificial, then add 1 to intPos
        // or maybe, add 1 to intPos for each artificial member before you
        int limit = intPos;
        for (int i = 0; i <= limit; i++) {
          if (DIDerivedType *artificialCheckDT =
                  dyn_cast_or_null<DIDerivedType>(CT->getElements()[i])) {
            // artificialCheckDT->dump();
            if (artificialCheckDT->isArtificial()) {
              intPos++;
            }
          }
        }

        if (DIDerivedType *memberField =
                dyn_cast_or_null<DIDerivedType>(CT->getElements()[intPos])) {
          // memberField->dump();
          if (!memberField->isArtificial()) {
            nodeSQM fieldNode =
                addUniqueNewNode("Field", memberField, memberField->getLine());

            // If this field accesses an instance of a class, that goes
            // here
            nodeSQM classNode = fieldParameterFinder(GEP->getPointerOperand());

            nodeSQM scopeNode;
            DILocalScope *memberScope = GEP->getDebugLoc()->getScope();
            if (DILexicalBlock *LB = dyn_cast<DILexicalBlock>(memberScope)) {
              // DANGER: COPY
              //scopeNode = addUniqueNewNode("Scope", "--", LB->getFilename(), LB->getLine(), LB->getColumn());
              scopeNode = branchScopeSpecifier(GEP);
            } else if (DISubprogram *SP = dyn_cast<DISubprogram>(memberScope)) {
              scopeNode = addUniqueNewNode(
                  "MethodScope", "--", SP->getFilename(), SP->getScopeLine());
            }
            if (!classNode.isEmpty()) {
              addUniqueNewEdge(classNode.numericID, fieldNode.numericID,
                               scopeNode.numericID, "Accesses");
              addUniqueNewEdge(fieldNode.numericID, classNode.numericID,
                               scopeNode.numericID, "CandidateRead");
            }

            return fieldNode;
          }
        }
      }
    }   
  }
  nodeSQM emptyNode;
  return emptyNode;
}

// makes a vector of all of the operands in some mathy statement
std::vector<nodeSQM> binaryOperatorRecurseNodeGenerator(BinaryOperator *OBO) {
  std::vector<nodeSQM> operandsVec = {};
  for (Use &op : OBO->operands()) {
    //op->dump();
    // for certain floating point situations
    if (CastInst *CI = dyn_cast<CastInst>(op)) {
      op = CI->getOperand(0);
    }
    if (BinaryOperator *BO = dyn_cast<BinaryOperator>(op)) {
      std::vector<nodeSQM> interiorVec = binaryOperatorRecurseNodeGenerator(BO);
      operandsVec.insert(operandsVec.end(), interiorVec.begin(), interiorVec.end());
    } else if (LoadInst *LI = dyn_cast<LoadInst>(op)) {
        // assuming this load points to something easy like an alloca
      operandsVec.insert(operandsVec.begin(),
                         fieldParameterFinder(LI->getPointerOperand()));
    } else if (CallBase *CB = dyn_cast<CallBase>(op)) {
        // callbase means there's a function here
      nodeSQM functionNode;
      Function *calledFunction = CB->getCalledFunction();
      if (calledFunction->getSubprogram() == NULL) {
        functionNode = undefinedFunctionNodes(calledFunction)[0];
      } else {
        functionNode = subprogramNodeGenerator(calledFunction->getSubprogram());
      }
      operandsVec.insert(operandsVec.begin(), functionNode);
    } else {
      // assuming a literal here
      // for things like negate, there'll be a 0 literal added
      operandsVec.insert(operandsVec.begin(), nonStringLiteralFinder(OBO, op));
    }
  }
  return operandsVec;
}

std::tuple<std::vector<nodeSQM>, nodeSQM>
storeInstFieldNodeGenerator(StoreInst *SI) {
  // just storeinst for now since this is overwhelming
  // operand 0 (storeValue) is the thing to be stored
  // operand 1 (storePointer) is the storage location pointer (the variable can be drilled out!)
  Value *storeValue = SI->getValueOperand();
  Value *storePointer = SI->getPointerOperand();

  // drill through castinsts since that's all a bunch of internal junk mostly
  while (CastInst *CI = dyn_cast<CastInst>(storeValue)) {
    storeValue = CI->getOperand(0);
  }

  nodeSQM writeNode = nonStringLiteralFinder(SI, storeValue);
  // errs() << writeNode << "\n";
  std::vector<nodeSQM> writeVec = {writeNode};
  // if not a non-string literal:
  if (writeNode.isEmpty()) {
    // pointer here
    // can be a LOAD for something
    // can load another STORE...
    // TODO:? recurse this!
    // can point directly to something, like an i32
    // in this case you must dig pointerwise
    // like for the uniqueFieldNode below!    

    if (LoadInst *LI = dyn_cast<LoadInst>(storeValue)) {
      writeVec = {fieldParameterFinder(LI->getPointerOperand())};
        //errs() << writeNode << "\n";
    } else if (BinaryOperator *BO = dyn_cast<BinaryOperator>(storeValue)) {
        // for binary operations on assignment, etc.
      writeVec = binaryOperatorRecurseNodeGenerator(BO);
      //for (nodeSQM node : writeVec) {
      //  errs() << node << "\n";
      //}
    } else if (CmpInst *CMP = dyn_cast<CmpInst>(storeValue)) {
      for (Use &op : CMP->operands()) {
        //op->dump();
        while (CastInst *nCI = dyn_cast<CastInst>(op)) {
          op = nCI->getOperand(0);
        }
        //op->dump();
        if (Constant *CON = dyn_cast<Constant>(op)) {
          writeVec.push_back(nonStringLiteralFinder(CMP, op));
        } else if (LoadInst *LI = dyn_cast<LoadInst>(op)) {
          writeVec.push_back(fieldParameterFinder(LI->getPointerOperand()));
        }
      }
    } else if (PHINode *PN = dyn_cast<PHINode>(storeValue)) {
      for (int i = 0; i < PN->getNumIncomingValues(); i++) {
        Value *incoming = PN->getIncomingValue(i);
        if (Constant *inConst = dyn_cast<Constant>(incoming)) {
          if (BranchInst *BI = dyn_cast<BranchInst>(
                  PN->getIncomingBlock(i)->getTerminator())) {
            if (BI->isConditional()) {
              incoming = BI->getCondition();
            } else if (incoming == NULL) {
              // DANGER: copied into return instruction stuff
              // TODO: resolve this
              // not clear how to handle this - returning a nullptr directly
              // isn't clear to me
              errs() << "NULL POINTER\a\n";
            }
          }
        }
        if (CastInst *CI = dyn_cast<CastInst>(incoming)) {
          incoming = CI->getOperand(0);
        }
        if (LoadInst *LI = dyn_cast<LoadInst>(incoming)) {
          //errs() << fieldParameterFinder(LI->getPointerOperand()) << "\n";
          writeVec.push_back(
              fieldParameterFinder(LI->getPointerOperand()));
        } else if (CallBase *CB = dyn_cast<CallBase>(incoming)) {
          for (Use &op : CB->args()) {
            if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(op)) {
              writeVec.push_back(classFieldNodeGEP(GEP));
            }
          }
        } else if (CmpInst *CMP = dyn_cast<CmpInst>(incoming)) {
          for (Use &op : CMP->operands()) {
            if (LoadInst *LI = dyn_cast<LoadInst>(op)) {
              if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(LI->getPointerOperand())) {
                writeVec.push_back(classFieldNodeGEP(GEP));
              }
            }
          }
        }
      }
    } else if (CallBase *CB = dyn_cast<CallBase>(storeValue)) {
      //CB->dump();
      CallBase *finalCB = CB;
      if (CB->hasMetadata(StringRef("heapallocsite"))) {
        // specialization for weird class/node shit
        // tremendously wretched
        // TODO: unfuck
        // this is like this because you can only really tell when "new" is
        // being used like this via the "heapallocsite" debug line
        // HOWEVER, there's no easy way to reach the actual proper constructor
        // so it has to be this heinous roundabout SHIT
        // until I can find something better but :/
        if (DICompositeType *CT = dyn_cast<DICompositeType>(
                CB->getMetadata(StringRef("heapallocsite")))) {
          // CT->dump();
          for (User *U : CB->users()) {
            if (CastInst *CI = dyn_cast<CastInst>(U)) {
              for (User *U : CI->users()) {
                if (CallBase *constructorCall = dyn_cast<CallBase>(U)) {
                  // make sure the class is in the nodes
                  nodeSQM uniqueTypeNode = typeNodeGenerator(CT);
                  // TODO:? add the compositeMemberNodeGenerator here
                  // get the proper, defined constructor method
                  // this should not be pulled out of the CT since those hook to
                  // declarations and not definitions
                  // TODO:? if one day it comes to pass that I can pull the
                  // defined functions from the CT, this can be updated
                  finalCB = constructorCall;
                  break;
                  // TODO: maybe want to use GOTO or a lambda or something here...?
                  // this code is so jank that I really ought to jump out of loops when I can
                }
              }
            }
          }
        }
      }
      // the normal route for function output
      Function *F = finalCB->getCalledFunction();
      if (F != NULL) {
        nodeSQM functionNode;
        if (F->getSubprogram() == NULL) {
          // primary expected use is malloc, which bizarrely doesn't want to be included
          functionNode = undefinedFunctionNodes(F)[0];
        } else {
          functionNode = subprogramNodeGenerator(F->getSubprogram());
        }
        writeVec.push_back(functionNode);
      } else {
        // TODO: what the hell is even this???
        // so, it turns out there are funky calls that make use of constantexprs to bitcast or otherwise obfuscate the called function
        // I don't really know if these calls *should* be dredged up like this but eh, why not try and make sure
        // TODO: add this to the callbase stuff in the instructions section of the pass
        for (Use &op : finalCB->operands()) {
          if (ConstantExpr *CE = dyn_cast<ConstantExpr>(op)) {
            if (CastInst *CI = dyn_cast<CastInst>(CE->getAsInstruction())) {
              if (Function *F = dyn_cast_or_null<Function>(CI->getOperand(0))) {
                nodeSQM functionNode =
                    subprogramNodeGenerator(F->getSubprogram());
                writeVec.push_back(functionNode);
              }
            }
          }
        }
      }
    } else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(storeValue)) {
      writeVec.push_back(classFieldNodeGEP(GEP));
    }
  }

  //for (nodeSQM node : writeVec) {
  //  errs() << node << "\n";
  //}

  nodeSQM uniqueFieldNode;

  if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(storePointer)) {
    uniqueFieldNode = classFieldNodeGEP(GEP);
  } else {
    uniqueFieldNode = fieldParameterFinder(storePointer);
  }

  //errs() << uniqueFieldNode << "\n";

  return {writeVec, uniqueFieldNode};
}

// for convenience when making some nodes
nodeSQM typeNodeGenerator(DIType *T) {
  // TODO: drill into DIDerivedTypes
  // will something like a member or inheritance tag ever end up here?
  // be wary of when this might show up in classes

  while (DIDerivedType *DT = dyn_cast_or_null<DIDerivedType>(T)) {
    if (DT->getBaseType() == NULL) {
      if (DT->getTag() == 15) {
        return addUniqueNewNode("TypeName", "void pointer");
      } else {
        break;
      }
    } else {
      T = DT->getBaseType();
    }
  }

  unsigned tag = T->getTag();
  std::string typeKind = "TypeName";

  if (DICompositeType *CT = dyn_cast<DICompositeType>(T)) {
    switch (tag) {
    case 19:
      // for structs
    case 2:
      typeKind = "CLASS";
      break;
    case 4:
      typeKind = "ENUM";
      break;
    case 23:
      // TODO: figure out unions
      // see the email
      typeKind = "UNION";
      break;
    case 1:
      // array_type unspecified here...
    default:
      typeKind = "TypeName";
    }
  }
  return addUniqueNewNode(typeKind, T, T->getLine());
}

// for identifying members of compositetypes
void compositeMemberNodeGenerator(DICompositeType *CT,
                                  nodeSQM currentCompositeNode) {
  // keep track of already checked compositeNodes and skip if they already exist
  static std::vector<nodeSQM> checkedNodes;
  auto search =
      std::find(checkedNodes.begin(), checkedNodes.end(), currentCompositeNode);
  if (search == checkedNodes.end()) {
    checkedNodes.push_back(currentCompositeNode);
    // PATHEXCLUSION
    if (CT->getDirectory().find(nodeSQM::getCurrentPath()) !=
        std::string::npos) {

      unsigned tag = CT->getTag();
      switch (tag) {
      case 1:
        // array_type unspecified here...
        break;
      case 19:
        // STRUCT
      case 2:
        // CLASS
        for (auto *element : CT->getElements()) {
          // according to the docs there should only be derived members or
          // functions in here also inheritance?
          if (DIDerivedType *memberField = dyn_cast<DIDerivedType>(element)) {
            if (memberField->isArtificial()) {
              continue;
            }
            // drill into pointers here
            unsigned memberTag = memberField->getTag();
            if (memberTag == 15 || memberTag == 16) {
              // check for pointers and references
              if (memberField->getBaseType() == NULL) {
                // don't handle null pointers for now
                // TODO: more properly handle null pointers
                // this continue means I don't need an else
                // I may need an else when I get around to nullptrs
                continue;
              }
              memberField = cast<DIDerivedType>(memberField->getBaseType());
            } else if (memberTag == 28) {
              // check for inheritance
              DIType *parentType = memberField->getBaseType();
              nodeSQM uniqueTypeNode = typeNodeGenerator(parentType);
              // TODO:? add the compositeMemberNodeGenerator here
              // this would be relevant in cases where you have a chain of
              // inheritances and any of the parents are not used as types
              // elsewhere think abstract type stuff, I guess

              addUniqueNewEdge(uniqueTypeNode.numericID,
                               currentCompositeNode.numericID,
                               currentCompositeNode.numericID, "ParentType");
              addUniqueNewEdge(currentCompositeNode.numericID,
                               uniqueTypeNode.numericID,
                               currentCompositeNode.numericID, "ChildType");
              // skip the rest if you get here
              // no field node should be built for this stuff
              // and public/private stuff maybe doesn't make sense for
              // inheritance
              // TODO:? check if public/private stuff makes sense for
              // inheritance
              // TODO: yo there's private inheritance and shit, but idk how that works with this setup
              continue;
            }

            nodeSQM uniqueFieldNode =
                addUniqueNewNode("Field", memberField, memberField->getLine());

            addUniqueNewEdge(currentCompositeNode.numericID,
                             uniqueFieldNode.numericID,
                             currentCompositeNode.numericID, "Member");
            addUniqueNewEdge(uniqueFieldNode.numericID,
                             currentCompositeNode.numericID,
                             currentCompositeNode.numericID, "MemberOf");

            
            // had to forward declare this!
            // so be aware of that in case something screwy happens here
            definitionEdgeConnector(memberField->getBaseType(),
                                    uniqueFieldNode);
            

            // CLASS access is private by default
            std::string accessSpec = "Private";
            if (tag == 19) {
              accessSpec = "Public";
            }
            if (memberField->isPublic()) {
              accessSpec = "Public";
            } else if (memberField->isProtected()) {
              accessSpec = "Protected";
            } else if (memberField->isPrivate()) {
              accessSpec = "Private";
            }
            nodeSQM annotNode =
                addUniqueNewNode(accessSpec, "--", memberField->getFilename());
            addUniqueNewEdge(uniqueFieldNode.numericID, annotNode.numericID,
                             uniqueFieldNode.numericID, "Annotation");

            // static keyword
            // for static member variables
            if (memberField->isStaticMember()) {
              nodeSQM annotNode =
                  addUniqueNewNode("Static", "--", memberField->getFilename());
              addUniqueNewEdge(uniqueFieldNode.numericID, annotNode.numericID,
                               uniqueFieldNode.numericID, "Annotation");
            }
          }
        }
        break;
      case 4:
        // ENUM
        for (auto *element : CT->getElements()) {
          DIEnumerator *value = dyn_cast<DIEnumerator>(element);
          nodeSQM valueNode = addUniqueNewNode("Value", value->getName());
          addUniqueNewEdge(currentCompositeNode.numericID, valueNode.numericID,
                           currentCompositeNode.numericID, "Member");
          addUniqueNewEdge(valueNode.numericID, currentCompositeNode.numericID,
                           currentCompositeNode.numericID, "MemberOf");
        }
        break;
      case 23:
        // UNION
        break;
      default:
        // something wrong occurred if this is even reachable
        // possibly with LLVM itself
        errs() << "ERROR IDENTIFYING DICOMPOSITETYPE\n";
        errs() << currentCompositeNode << "\n";
      }
    }
  }
}

// DefinitionOf/InstanceOf connector
// Now covers subs too!
void definitionEdgeConnector(DIType *TN, nodeSQM uniqueFieldNode, bool isSub) {
  // may need to chop out situations where the variable is an object (and thus
  // the type is a class)

  while (DIDerivedType *DT = dyn_cast_or_null<DIDerivedType>(TN)) {
    if (DT->getBaseType() == NULL) {
        // just rely on typeNodeGenerator, okay?
      break;
    } else {
      TN = DT->getBaseType();
    }
  }

  nodeSQM uniqueTypeNode;
  uniqueTypeNode = typeNodeGenerator(TN);
  if (DICompositeType *CT = dyn_cast<DICompositeType>(TN)) {
    compositeMemberNodeGenerator(CT, uniqueTypeNode);
    // subdefinition checker
    for (DITemplateParameter *TP : CT->getTemplateParams()) {
      // TODO: expand this, perhaps
      // DITemplateParameter covers not only some sort of Type parameter,
      // but also some kind of value parameter
      if (TP->getName().find("_Ty") != std::string::npos) {
        DIType *subTN = TP->getType();
        definitionEdgeConnector(subTN, uniqueFieldNode, true);
      }
    }
  }
  
  std::string subPart = "";
  if (isSub) {
    subPart = "Sub";
  }
  addUniqueNewEdge(uniqueTypeNode.numericID, uniqueFieldNode.numericID,
                   uniqueFieldNode.numericID, subPart + "DefinitionOf");
  addUniqueNewEdge(uniqueFieldNode.numericID, uniqueTypeNode.numericID,
                   uniqueFieldNode.numericID, subPart + "InstanceOf");
}

nodeSQM subprogramNodeGenerator(DISubprogram *S) {
  // TODO: find a way to remove non-distinct declarations
  nodeSQM currentMethodNode;
  // dubious definitions
  DIScope *methodDIScope = S->getScope();
  if (methodDIScope->getName() == S->getName()) {
    currentMethodNode = addUniqueNewNode("Constructor", S, S->getLine());
    // Classes with constructors also contain this subprogram (not unique)
  } else {
    currentMethodNode = addUniqueNewNode("Method", S, S->getLine());

    // get return type
    // it's here since constructors return nothing, not even void
    nodeSQM uniqueReturnType;
    DITypeRefArray TA = S->getType()->getTypeArray();
    if (DIType *TNO = TA[0]) {
      uniqueReturnType = typeNodeGenerator(TNO);

      if (DICompositeType *CT = dyn_cast_or_null<DICompositeType>(TNO)) {
        compositeMemberNodeGenerator(CT, uniqueReturnType);
      }

    } else if (TA[0] == NULL) {
      uniqueReturnType = addUniqueNewNode("TypeName", "void");
    }

    addUniqueNewEdge(currentMethodNode.numericID, uniqueReturnType.numericID,
                     -1, "ReturnType");
  }
  // PATHEXCLUSION
  if (S->getDirectory().find(nodeSQM::getCurrentPath()) != std::string::npos) {

    // get scope?
    nodeSQM methodScopeNode = addUniqueNewNode(
        "MethodScope", "--", S->getFilename(), S->getScopeLine());

    // there's member edges between methods and their scopes..!
    addUniqueNewEdge(currentMethodNode.numericID, methodScopeNode.numericID,
                     currentMethodNode.numericID, "Member");
    addUniqueNewEdge(methodScopeNode.numericID, currentMethodNode.numericID,
                     currentMethodNode.numericID, "MemberOf");

    // free-floating static functions
    if (S->isLocalToUnit()) {
      nodeSQM annotNode = addUniqueNewNode("Static", "--", S->getFilename());
      // TODO:? the location of this edge may need to change to the
      // declaration space
      addUniqueNewEdge(currentMethodNode.numericID, annotNode.numericID,
                       currentMethodNode.numericID, "Annotation");
    }

    if (DICompositeType *CT = dyn_cast<DICompositeType>(methodDIScope)) {
      nodeSQM currentCompositeNode = typeNodeGenerator(CT);
      compositeMemberNodeGenerator(CT, currentCompositeNode);
      addUniqueNewEdge(currentCompositeNode.numericID,
                       currentMethodNode.numericID,
                       currentCompositeNode.numericID, "Member");
      addUniqueNewEdge(currentMethodNode.numericID,
                       currentCompositeNode.numericID,
                       currentCompositeNode.numericID, "MemberOf");

      // access specifiers only occur in classes, structs, or unions
      // thus, they only occur when the scope is a DICompositeType

      if (DISubprogram *declaration = S->getDeclaration()) {
        // for now, the default is private
        // classes have private default, but structs and unions both have public

        std::string accessSpec = "Private";
        if (CT->getTag() == 19) {
          accessSpec = "Public";
        }
        if (declaration->isPublic()) {
          accessSpec = "Public";
        } else if (declaration->isProtected()) {
          accessSpec = "Protected";
        } else if (declaration->isPrivate()) {
          accessSpec = "Private";
        }
        nodeSQM annotNode =
            addUniqueNewNode(accessSpec, "--", declaration->getFilename());
        // TODO:? the location of Annotation edges may need to change to the
        // declaration space
        addUniqueNewEdge(currentMethodNode.numericID, annotNode.numericID,
                         currentMethodNode.numericID, "Annotation");

        if (declaration->getFlags() & DISubprogram::FlagStaticMember) {
          nodeSQM annotNode =
              addUniqueNewNode("Static", "--", declaration->getFilename());
          // TODO:? the location of this edge may need to change to the
          // declaration space
          addUniqueNewEdge(currentMethodNode.numericID, annotNode.numericID,
                           currentMethodNode.numericID, "Annotation");
        }

        // can get to virtual flags from here if needed...?
        // TODO: virtuals/interfaces?
        // INTERFACE might even replace Method, as Constructor does...
        // Note: this only should appy to SPFlagPureVirtual - that's the
        // abstracting one
      }
    }

    // looking for DILocalVariables........
    // specifically looking for arrayInvokes here
    // SCARY - this code made with no thought at all
    for (auto *element : S->getRetainedNodes()) {
      if (DILocalVariable *V = dyn_cast<DILocalVariable>(element)) {
        // identify array invokes
        auto targetType = V->getType();
        if (targetType->getTag() == 1) {
          nodeSQM uniqueArrayNode = addUniqueNewNode(
              "ArrayInvoke", V->getName(), V->getFilename(), V->getLine());
          addUniqueNewEdge(methodScopeNode.numericID, uniqueArrayNode.numericID,
                           methodScopeNode.numericID, "Member");
          addUniqueNewEdge(uniqueArrayNode.numericID, methodScopeNode.numericID,
                           methodScopeNode.numericID, "MemberOf");
          // TODO:? SubDefinitionOf and SubInstanceOf edges
        }
        // identify params & fields - not clear if this needs to be more
        // separated from array invokes... gets screwy with pointers and
        // references it seems also has other weird behavior I don't get I'm
        // including this isArtificial for now to get rid of the "this"s
        // everywhere but they may need to come back (field?)
        if (!V->isArtificial()) {
          nodeSQM uniqueMemberNode;
          if (V->getArg() != 0) {
            uniqueMemberNode = addUniqueNewNode("Parameter", V->getName(),
                                                V->getFilename(), V->getLine());
            addUniqueNewEdge(currentMethodNode.numericID,
                             uniqueMemberNode.numericID,
                             currentMethodNode.numericID, "FormalParameter");
            addUniqueNewEdge(uniqueMemberNode.numericID,
                             currentMethodNode.numericID,
                             currentMethodNode.numericID, "MemberOf");
          } else {
            uniqueMemberNode = addUniqueNewNode("Field", V->getName(),
                                                V->getFilename(), V->getLine());
            // TODO: correct scopes, particularly for Loops!
            nodeSQM scopeNode = methodScopeNode;
            DILocalScope *memberScope = V->getScope();
            if (DILexicalBlock *LB = dyn_cast<DILexicalBlock>(memberScope)) {
              // TODO: what if the scope already exists but has a different,
              // more specific name, like "ElseScope"? DANGER: COPY
              scopeNode = addUniqueNewNode("Scope", "--", LB->getFilename(),
                                           LB->getLine(), LB->getColumn());
            }
            addUniqueNewEdge(scopeNode.numericID, uniqueMemberNode.numericID,
                             scopeNode.numericID, "Member");
            addUniqueNewEdge(uniqueMemberNode.numericID, scopeNode.numericID,
                             scopeNode.numericID, "MemberOf");
          }

          // now connect this field's type
          definitionEdgeConnector(V->getType(), uniqueMemberNode);
          
        }
      }
    }
  } else {
  // this else is only here so long as the nodes outside the directory scope are not counted
  // this is to help connect parameters
  // PATHEXCLUSION
    for (auto *element : S->getRetainedNodes()) {
      if (DILocalVariable *V = dyn_cast<DILocalVariable>(element)) {
        if (!V->isArtificial() && V->getArg() != 0) {
          nodeSQM uniqueMemberNode = addUniqueNewNode(
              "Parameter", V->getName(), V->getFilename(), V->getLine());
          addUniqueNewEdge(currentMethodNode.numericID,
                           uniqueMemberNode.numericID,
                           currentMethodNode.numericID, "FormalParameter");
          addUniqueNewEdge(uniqueMemberNode.numericID,
                           currentMethodNode.numericID,
                           currentMethodNode.numericID, "MemberOf");

          definitionEdgeConnector(V->getType(), uniqueMemberNode);
        }
      }
    }
  }
  return currentMethodNode;
}

// define static variables for counting and retaining
int nodeSQM::nodeCount = 0;
std::vector<nodeSQM> nodeSQM::nodeVec = {};
std::string nodeSQM::currentPath = std::filesystem::current_path().string();
std::vector<edgeSQM> edgeSQM::edgeVec = {};

// main, essentially
PreservedAnalyses ZPassTestModulePass::run(Module &M,
                                      ModuleAnalysisManager &AM) {
  errs() << M.getName() << "\n";
  
  // global variable iterator
  // DANGER: CODE COPIED FROM LOCAL VARIABLE STUFF
  // also, it seems that integer globals initialize to 0 even when they've got no value
  for (Module::global_iterator MB = M.global_begin(), ME = M.global_end(); MB != ME; ++MB) {
    GlobalVariable *nonDebugGV = dyn_cast<GlobalVariable>(MB);
    SmallVector<DIGlobalVariableExpression*> globalVec;
    nonDebugGV->getDebugInfo(globalVec);
    // it's possible this for loop is unneeded
    // not sure whether or not this vector will ever contain more than 1 element
    for (DIGlobalVariableExpression *GVE : globalVec) {
      DIGlobalVariable *G = GVE->getVariable();
      if (G->getDirectory().find(nodeSQM::getCurrentPath()) != std::string::npos) {
        // DANGER: CODE COPIED FROM LOCAL VARIABLE STUFF

        // identify array invokes
        auto targetType = G->getType();
        if (targetType->getTag() == 1) {
          addUniqueNewNode("ArrayInvoke", G->getName(), G->getFilename(),
                           G->getLine());
        }

        // identify fields - not clear if this needs to be more
        // separated from array invokes... gets screwy with pointers and
        // references it seems also has other weird behavior I don't get
        nodeSQM uniqueFieldNode = addUniqueNewNode(
            "Field", G->getName(), G->getFilename(), G->getLine());

        // TODO: check if there are other circumstances
        // is it always true that a static function variable is global?
        // are all "local" globals static?
        if (G->isLocalToUnit()) {
          nodeSQM annotNode =
              addUniqueNewNode("Static", "--", G->getFilename());
          addUniqueNewEdge(uniqueFieldNode.numericID, annotNode.numericID,
                           uniqueFieldNode.numericID, "Annotation");
        }

        // now get this field's type
        DIType *TN = G->getType();
        // not trying the recursive drill thing yet
        // no pointers yet either
        // TODO: non-literals??
        // TODO: binary operations??
        
        definitionEdgeConnector(TN, uniqueFieldNode);
        
        // try to hook initializing literals to globals
        // DANGER: COPIED CODE FROM nonStringLiteralFinder AND THE LOCAL
        // VARIABLE SECTION also find a better way to handle this "case" system
        // may want an enumeration for the 5 Literal kinds
        nodeSQM literalNode;
        if (ConstantFP *FP =
                dyn_cast<ConstantFP>(nonDebugGV->getInitializer())) {
          // be aware of floating point precision errors...
          SmallString<32> floatVec;
          (FP->getValue()).toString(floatVec);
          literalNode = addUniqueNewNode("Literal", floatVec.str(),
                                         G->getFilename(), G->getLine());
          definitionEdgeConnector(TN, literalNode);
          
        } else if (ConstantInt *CI =
                       dyn_cast<ConstantInt>(nonDebugGV->getInitializer())) {
          std::string typeName = (TN->getName()).str();
          std::string literalString = (CI->getValue()).toString(10, true);
          // may want to chop out this if-else-if for something nicer...
          if (typeName == "char") {
            std::string charString(1, (char)stoi(literalString));
            literalString = charString;
          } else if (typeName == "bool") {
            literalString = stoi(literalString) ? "true" : "false";
          }
          literalNode = addUniqueNewNode("Literal", literalString,
                                         G->getFilename(), G->getLine());
          definitionEdgeConnector(TN, literalNode);
        } else if (GlobalVariable *definingGlobal =
                       dyn_cast<GlobalVariable>(nonDebugGV->getInitializer())) {
          literalNode = globalFieldFinder(definingGlobal);
        }

        if (!uniqueFieldNode.isEmpty() && !literalNode.isEmpty()) {
          addUniqueNewEdge(uniqueFieldNode.numericID, literalNode.numericID,
                           uniqueFieldNode.numericID, "WrittenBy");
          addUniqueNewEdge(literalNode.numericID, uniqueFieldNode.numericID,
                           uniqueFieldNode.numericID, "CandidateRead");
        }

        

      }
    }
  }

  // function iterator
  // using a million dyn_casts is shit, look into this here: https://llvm.org/doxygen/classllvm_1_1InstVisitor.html
  for (Module::iterator MB = M.begin(), ME = M.end(); MB != ME; ++MB) {
    Function *F = dyn_cast<Function>(MB);
    if (DISubprogram *S = F->getSubprogram()) {
      // be warned of the isDistinct flag! 
      // using the find function here lets us see the functions from any file in the whole directory
      if (S->getDirectory().find(nodeSQM::getCurrentPath()) !=
              std::string::npos &&
          !S->isArtificial() &&
          S->isDistinct()) {
        errs() << "F: " << S->getName() << "\n";
        
        nodeSQM currentMethodNode = subprogramNodeGenerator(S);
        nodeSQM currentMethodScopeNode = addUniqueNewNode(
            "MethodScope", "--", S->getFilename(), S->getScopeLine());

        // sret return cases go here!
        // it seems srets only appear in the first or second pointer argument
        // I assume this means: if it's in 0, that's just a free function
        // if its in 1, then this sret is a class method
        if (F->hasStructRetAttr()) {
          for (int argPos = 0; argPos < 2; argPos++) {
            if (F->getParamStructRetType(argPos)) {
              // get pointer of argument
              for (User *U : F->getArg(argPos)->users()) {
                // since a function could have multiple return statements in it,
                // check every relevant assignment
                if (CallBase *CB = dyn_cast<CallBase>(U)) {
                  // Node for strings
                  nodeSQM retNode =
                      stringLiteralFinder(CB->getArgOperand(1), &*CB);

                  // classes and other sret kinds!
                  // TODO: look into this more closely...
                  if (retNode.isEmpty()) {
                    for (User *CBU : CB->getArgOperand(0)->users()) {
                      if (CastInst *CI = dyn_cast<CastInst>(CBU)) {
                        for (User *CIU : CI->users()) {
                          if (StoreInst *SI = dyn_cast<StoreInst>(CIU)) {
                            auto [writtenVec, uniqueMemberNode] =
                                storeInstFieldNodeGenerator(SI);
                            retNode = uniqueMemberNode;
                          }
                        }
                      }
                    }
                  }

                  if (!retNode.isEmpty()) {
                    addUniqueNewEdge(
                        currentMethodNode.numericID, retNode.numericID,
                        currentMethodScopeNode.numericID, "ReturnValue");
                  }
                }
              }
            }
          }
        }

        for (inst_iterator IB = inst_begin(F), IE = inst_end(F); IB != IE;
             ++IB) {
          errs() << "I: " << *IB << "\n";
          nodeSQM scopeNode = currentMethodScopeNode;
          // the "Scope" lines used to be here, but were moved to make branch nodes less painful

          // TODO:? implement an LLVM instvisitor instead of doing a million if/elses

          // conditionals
          // want to split whiles, for3s, forEachs, and if/thens apart but for
          // now it's just This Shit appears to also represent &&, ||
          if (BranchInst *BI = dyn_cast<BranchInst>(&*IB)) {
            if (BI->isConditional()) {
              // check if this branch is just an operator, and skip if it is
              bool isOperator = false;
              for (BasicBlock *successor : BI->successors()) {
                for (BasicBlock::iterator BB = successor->begin(),
                                          BE = successor->end();
                     BB != BE; ++BB) {
                  if (PHINode *PI = dyn_cast<PHINode>(BB)) {
                    isOperator = true;
                  }
                  break;
                }
              }
              if (!isOperator) {

                DILocation *Loc = BI->getDebugLoc();
                BasicBlock *parentBlock = BI->getParent();
                bool isLoop = false;
                BranchInst *loopOwner = BI;
                for (User *U : parentBlock->users()) {
                  if (BranchInst *UBI = dyn_cast<BranchInst>(U)) {
                    if (UBI->hasMetadata(StringRef("llvm.loop"))) {
                      isLoop = true;
                      loopOwner = UBI;
                    } else if (BI->hasMetadata(StringRef("llvm.loop"))) {
                      isLoop = true;
                    }
                  }
                }

                // want to find a way to check that the successors are in the
                // right order... the size check is a temporary patch - this
                // will be janky no matter what since LLVM labels are not
                // meant to be used for actual code stuff (whoops!). it may be
                // best to do some kind of line number difference checking
                // thing to determine order. is there any way for an else to
                // come before a then...? in certain circumstances, such as
                // when a macro is inserting code, the else and then locations
                // are "the same." however, they should still have different
                // LEXICALBLOCKS - if one block is in the scope of the other,
                // the first must be the THEN and the second (ELSE) must not
                // be an else statement - it'd be the branch container in this
                // case
                // TODO: THIS
                BasicBlock *BBThen = BI->getSuccessor(0);
                BasicBlock *BBElse = BI->getSuccessor(1);

                if (BBThen->size() == 1) {
                  BI->swapSuccessors();
                  BBThen = BI->getSuccessor(0);
                  BBElse = BI->getSuccessor(1);
                } else if (BBElse->size() > 1) {
                  Instruction *ThenBlockCheck = &BBThen->front();
                  DILocation *ThenCheckLoc = ThenBlockCheck->getDebugLoc();
                  Instruction *ElseBlockCheck = &BBElse->front();
                  DILocation *ElseCheckLoc = ElseBlockCheck->getDebugLoc();

                  while (ThenCheckLoc == nullptr) {
                    ThenBlockCheck =
                        ThenBlockCheck->getNextNonDebugInstruction();
                    ThenCheckLoc = ThenBlockCheck->getDebugLoc();
                  }

                  while (ElseCheckLoc == NULL) {
                    ElseBlockCheck =
                        ElseBlockCheck->getNextNonDebugInstruction();
                    ElseCheckLoc = ElseBlockCheck->getDebugLoc();
                  }

                  if (ThenCheckLoc->getLine() > ElseCheckLoc->getLine()) {
                    BI->swapSuccessors();
                    BBThen = BI->getSuccessor(0);
                    BBElse = BI->getSuccessor(1);
                  }
                }

                nodeSQM controlStructureNode;
                if (!isLoop) {
                  
                  //DILocation *ThenLoc = BBThen->back().getPrevNonDebugInstruction()->getDebugLoc();
                  Instruction *ThenInstruction = &BBThen->front();
                  DILocation *ThenLoc = ThenInstruction->getDebugLoc();
                  //TODO: if the front has a void debugloc get the next instruction
                  while (ThenLoc == NULL) {
                    ThenInstruction =
                        ThenInstruction->getNextNonDebugInstruction();
                    ThenLoc = ThenInstruction->getDebugLoc();
                  }

                  if (BasicBlock *trinaryResult =
                          BBThen->getSingleSuccessor()) {
                    // branchInsts may lead to PHINodes, which can indicate a trinary instead of a normal branch
                    if (trinaryResult == BBElse->getSingleSuccessor() &&
                        isa<PHINode>(trinaryResult->front())) {
                      controlStructureNode =
                          addUniqueNewNode("Trinary", "--", Loc->getFilename(),
                                           Loc->getLine(), Loc->getColumn());
                      if (DILexicalBlock *LB = dyn_cast<DILexicalBlock>(
                              trinaryResult->front().getDebugLoc()->getScope())) {
                        scopeNode =
                            branchScopeSpecifier(&trinaryResult->front());
                      } 
                    }
                  } else {
                    if (DILexicalBlock *ThenScope =
                            dyn_cast<DILexicalBlock>(ThenLoc->getScope())) {
                      // scope can be a function so watch out for that
                      // moving the Branch node statement into this block
                      // should a proper Branch ever NOT have a ThenScope?
                      // This should help remove situations where non-if/thens
                      // use branches internally
                      controlStructureNode =
                          addUniqueNewNode("Branch", "--", Loc->getFilename(),
                                           Loc->getLine(), Loc->getColumn());

                      nodeSQM controlledScope;
                      // this separation allows branches with and without curly
                      // brackets to work correctly
                      if (Loc->getScope() == ThenLoc->getScope()->getScope()) {
                        // should this be the one? is it best for the loc to be
                        // the back, or the front? especially when brackets are
                        // involved
                        ThenLoc = BBThen->back().getDebugLoc();
                        if (ThenLoc == NULL) {
                          ThenLoc = BBThen->front().getDebugLoc();
                        }
                        controlledScope = addUniqueNewNode(
                            "Then", "--", ThenLoc->getFilename(),
                            ThenLoc->getLine(), ThenLoc->getColumn());
                      } else {
                        controlledScope = addUniqueNewNode(
                            "Then", "--", ThenScope->getFilename(),
                            ThenScope->getLine(), ThenScope->getColumn());
                      }

                      addUniqueNewEdge(controlStructureNode.numericID,
                                       controlledScope.numericID,
                                       controlStructureNode.numericID,
                                       "Member");
                      addUniqueNewEdge(controlledScope.numericID,
                                       controlStructureNode.numericID,
                                       controlStructureNode.numericID,
                                       "MemberOf");

                      // if the branch is an elif, you need to do a little magic
                      // to make sure that the scope of this branch is actually
                      // the elsescope of the parent branch
                      bool branchScopeCheck = true;
                      if (DILexicalBlock *LB =
                              dyn_cast<DILexicalBlock>(Loc->getScope())) {
                        if (BasicBlock *parentPred =
                                parentBlock->getSinglePredecessor()) {
                          if (BranchInst *parentExit =
                                  dyn_cast<BranchInst>(&parentPred->back())) {
                            if (parentExit->isConditional() &&
                                parentExit->getSuccessor(1) == parentBlock) {
                              LB = dyn_cast<DILexicalBlock>(
                                  BI->getPrevNonDebugInstruction()
                                      ->getDebugLoc()
                                      ->getScope());
                              scopeNode = addUniqueNewNode(
                                  "Scope", "--", LB->getFilename(),
                                  LB->getLine(), LB->getColumn());
                              branchScopeCheck = false;
                            }
                          }
                        }
                        if (branchScopeCheck) {
                          scopeNode =
                              addUniqueNewNode("Scope", "--", LB->getFilename(),
                                               LB->getLine(), LB->getColumn());
                        }
                      }
                    }

                    while (BBElse->size() == 1) {
                      if (BranchInst *skippableBI =
                              dyn_cast<BranchInst>(&BBElse->front())) {
                        if (skippableBI->isUnconditional()) {
                          BBElse = skippableBI->getSuccessor(0);
                        } else {
                          break;
                        }
                      } else {
                        break;
                      }
                    }
                    if (!BBElse->hasNPredecessorsOrMore(2)) {
                      // Can a true ElseScope BB have multiple predecessors?
                      // I suspect not
                      Instruction *ElseInstruction =
                          BBElse->back().getPrevNonDebugInstruction();
                      DILocation *ElseLoc = ElseInstruction->getDebugLoc();
                      // the targetet instruction may have no !dbg flag
                      while (ElseLoc == NULL) {
                        ElseInstruction =
                            ElseInstruction->getPrevNonDebugInstruction();
                        ElseLoc = ElseInstruction->getDebugLoc();
                      }
                      if (DILexicalBlock *ElseScope =
                              dyn_cast<DILexicalBlock>(ElseLoc->getScope())) {

                        // add in an exception for things like For3Loops
                        // idea is that if the Then and Else scopes are
                        // DIFFERENT, and the else scope's scope is the Branch
                        // scope then probably it isn't a true elsescope here
                        // invert to get this:
                        // if elsescope==thenscope OR elsescope!=BRscope, then
                        // it's go time

                        if (ElseScope == ThenLoc->getScope() ||
                            ElseScope->getScope() != Loc->getScope()) {
                          nodeSQM controlledScope;
                          // this separation allows branches with and without
                          // curly brackets to work correctly
                          if (Loc->getScope() ==
                              ElseLoc->getScope()->getScope()) {
                            controlledScope = addUniqueNewNode(
                                "ElseScope", "--", ElseLoc->getFilename(),
                                ElseLoc->getLine(), ElseLoc->getColumn());
                          } else {
                            controlledScope = addUniqueNewNode(
                                "ElseScope", "--", ElseScope->getFilename(),
                                ElseScope->getLine(), ElseScope->getColumn());
                          }
                          addUniqueNewEdge(controlStructureNode.numericID,
                                           controlledScope.numericID,
                                           controlStructureNode.numericID,
                                           "Member");
                          addUniqueNewEdge(controlledScope.numericID,
                                           controlStructureNode.numericID,
                                           controlStructureNode.numericID,
                                           "MemberOf");
                        }
                      }
                    }
                  }
                  
                } else {
                  if (DILexicalBlock *LB =
                          dyn_cast<DILexicalBlock>(Loc->getScope())) {
                    scopeNode =
                        addUniqueNewNode("Scope", "--", LB->getFilename(),
                                         LB->getLine(), LB->getColumn());
                  }
                  bool isForEach = false;
                  // ForEachLoops are defined by the presence of certain
                  // artificial variables
                  for (BasicBlock::iterator BBB = parentBlock->begin(),
                                            BBE = parentBlock->end();
                       BBB != BBE; ++BBB) {
                    if (isa<CastInst>(BBB) || isa<LoadInst>(BBB)) {
                      for (auto uses : FindDbgDeclareUses(
                               cast<Instruction>(BBB)->getOperand(0))) {
                          // the __begin needs to be a substring of the originals
                          // since nested loops use the format __begin1, __begin2, etc.
                          // can also use __end, but NOT __range
                        if (uses->getVariable()->isArtificial() &&
                            ((uses->getVariable()->getName())
                                     .find("__begin") != std::string::npos)) {
                          isForEach = true;

                          Loc = cast<DILocation>(
                              loopOwner->getMetadata(StringRef("llvm.loop"))
                                  ->getOperand(1));

                          controlStructureNode = addUniqueNewNode(
                              "ForEachLoop", "--", Loc->getFilename(),
                              Loc->getLine(), Loc->getColumn());

                          // dig past the scope containing the initializer things
                          DILocalScope *presentScope = cast<DILexicalBlock>(Loc->getScope())->getScope();

                          if (DILexicalBlock *LScope =
                                  dyn_cast<DILexicalBlock>(presentScope)) {
                            scopeNode = addUniqueNewNode(
                                "Scope", "--", LScope->getFilename(),
                                LScope->getLine(), LScope->getColumn());
                          } else if (DISubprogram *SScope =
                                         dyn_cast<DISubprogram>(presentScope)) {
                            scopeNode = currentMethodScopeNode;
                          }

                          // get the read/write edge between
                          // the initializery thing
                          // and the container that's looped over here
                          // TODO: look at this since it makes big assumptions
                          // based on std::vectors mostly!
                          if (CallBase *CB = dyn_cast<CallBase>(&(BI->getSuccessor(0)->back()))) {
                            nodeSQM readNode = fieldParameterFinder(CB->getArgOperand(0));
                            for (User *U : cast<CallBase>(CB->getArgOperand(1))
                                               ->getArgOperand(0)
                                               ->users()) {
                              if (CallBase *UCB = dyn_cast<CallBase>(U)) {
                                if (UCB->getCalledFunction()->hasStructRetAttr()) {
                                  if (LoadInst *LI = dyn_cast<LoadInst>(
                                          UCB->getOperand(0))) {
                                    for (User *U : LI->getPointerOperand()->users()) {
                                      if (StoreInst *SI =
                                              dyn_cast<StoreInst>(U)) {
                                        nodeSQM writtenNode = fieldParameterFinder(
                                                      SI->getValueOperand());
                                        addUniqueNewEdge(readNode.numericID,
                                            writtenNode.numericID,
                                            scopeNode.numericID, "WrittenBy");
                                        addUniqueNewEdge(
                                            writtenNode.numericID,
                                                         readNode.numericID,
                                            scopeNode.numericID,
                                            "CandidateRead");
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          } else {
                              // TODO: array forEach...
                            for (BasicBlock::iterator
                                     AddBBB = BI->getSuccessor(0)->begin(),
                                     AddBBE = BI->getSuccessor(0)->end();
                                 AddBBB != AddBBE; ++AddBBB) {
                              if (StoreInst *SI = dyn_cast<StoreInst>(AddBBB)) {
                                if (LoadInst *LI = dyn_cast<LoadInst>(
                                        SI->getValueOperand())) {
                                  if (LoadInst *ILI = dyn_cast<LoadInst>(
                                          LI->getPointerOperand())) {
                                    // get the first StoreInst appearing
                                    // right now we're looking at a __begin or similar
                                    // since that's specific to this FEL,
                                    // there should be nothing but the target here

                                    Value *beginValue = ILI->getPointerOperand();
                                    beginValue->reverseUseList();
                                    for (User *IU : beginValue->users()) {
                                      if (StoreInst *ISI =
                                              dyn_cast_or_null<StoreInst>(IU)) {
                                        if (GetElementPtrInst *GEP =
                                                dyn_cast<GetElementPtrInst>(
                                                    ISI->getValueOperand())) {
                                          if (LoadInst *ItwoLI = dyn_cast<
                                                  LoadInst>(
                                                  GEP->getPointerOperand())) {
                                            for (User *beginU :
                                                 ItwoLI->getPointerOperand()
                                                     ->users()) {
                                              if (StoreInst *finalSI =
                                                      dyn_cast<StoreInst>(
                                                          beginU)) {
                                                nodeSQM readNode =
                                                    fieldParameterFinder(
                                                        SI->getPointerOperand());
                                                nodeSQM writtenNode =
                                                    fieldParameterFinder(
                                                        finalSI
                                                            ->getValueOperand());
                                                addUniqueNewEdge(
                                                    readNode.numericID,
                                                    writtenNode.numericID,
                                                    scopeNode.numericID,
                                                    "WrittenBy");
                                                addUniqueNewEdge(
                                                    writtenNode.numericID,
                                                    readNode.numericID,
                                                    scopeNode.numericID,
                                                    "CandidateRead");
                                                break;
                                              }
                                            }
                                          }
                                        }
                                        break;
                                      }
                                    }

                                    
                                  }
                                }
                                
                                break;
                              }
                            }
                          }

                          // nickel and dime some loop time
                          // TODO: make this a little nicer, right now this only breaks one loop and not both
                          break;
                        }
                      }
                    }
                  }
                  nodeSQM controlledScope;
                  BasicBlock *scopeSearchBlock =
                      loopOwner->getParent()->getSinglePredecessor();
                  if (scopeSearchBlock == NULL) {
                    for (BasicBlock *pred :
                         predecessors(loopOwner->getParent())) {
                      // TODO: loop instructions of the blocks, find some instruction WITH a nonnull debugloc, and make the block that finds it the scopeSearchBlock
                      for (BasicBlock::iterator predBBB = pred->begin(),
                                                predBBE = pred->end();
                           predBBB != predBBE; ++predBBB) {
                        if (DILocation *searchLoc =
                                cast<Instruction>(predBBB)->getDebugLoc()) {
                          scopeSearchBlock = pred;
                          break;
                        }
                      }
                    }
                  }
                  if (isForEach) {
                    // TODO: NEED TO CONNECT initializery thing TO THE LOOP NODE
                    DILocalScope *targetScope = Loc->getScope();
                    DILocalScope *firstLayerScope = NULL;
                    DILocalScope *secondLayerScope = NULL;

                    int stepsOut = 0;
                    while (stepsOut < 2) {
                      for (BasicBlock::iterator
                               SSBBB = scopeSearchBlock->begin(),
                               SSBBE = scopeSearchBlock->end();
                           SSBBB != SSBBE; ++SSBBB) {
                        if (DILocation *searchLoc =
                                cast<Instruction>(SSBBB)->getDebugLoc()) {
                          stepsOut = 0;
                          DILocalScope *currentScope = searchLoc->getScope();
                          firstLayerScope = currentScope;
                          secondLayerScope = currentScope;
                          while (currentScope != targetScope) {
                            secondLayerScope = firstLayerScope;
                            firstLayerScope = currentScope;
                            currentScope =
                                cast<DILexicalBlock>(currentScope)->getScope();
                            stepsOut += 1;
                          }
                          // when stepsOut is 2 or greater!
                          if (stepsOut >= 2) {
                            break;
                          }
                        }
                      }
                      scopeSearchBlock =
                          scopeSearchBlock->getSinglePredecessor();
                    }
                    if (DILexicalBlock *LB = dyn_cast_or_null<DILexicalBlock>(secondLayerScope)) {
                      controlledScope =
                          addUniqueNewNode("Scope", "--", LB->getFilename(),
                                           LB->getLine(), LB->getColumn());
                      // since the initializery thing is in a separate scope, hook that in too
                      DILexicalBlock *initializer =
                          cast<DILexicalBlock>(firstLayerScope);
                      nodeSQM initializerScope = addUniqueNewNode(
                          "Scope", "--", initializer->getFilename(),
                          initializer->getLine(), initializer->getColumn());
                      addUniqueNewEdge(controlStructureNode.numericID,
                                       initializerScope.numericID,
                                       controlStructureNode.numericID,
                                       "Member");
                      addUniqueNewEdge(initializerScope.numericID,
                                       controlStructureNode.numericID,
                                       controlStructureNode.numericID,
                                       "MemberOf");
                    }
                  } else {
                    
                    if (BI == loopOwner) {
                      // DoWhiles have the loop metadata on the conditional
                      // branch statement itself
                      // TODO: see if the Loc above can be replaced with this
                      // bizarre complications arise: why the FUCK does this
                      // change from 30:3 to 33:3????
                      Loc = cast<DILocation>(
                          loopOwner->getMetadata(StringRef("llvm.loop"))
                              ->getOperand(1));

                      controlStructureNode =
                          addUniqueNewNode("DoWhile", "--", Loc->getFilename(),
                                           Loc->getLine(), Loc->getColumn());
                      DILocalScope *presentScope = Loc->getScope();
                      if (DILexicalBlock *LScope =
                              dyn_cast<DILexicalBlock>(presentScope)) {
                        scopeNode = addUniqueNewNode(
                            "Scope", "--", LScope->getFilename(),
                            LScope->getLine(), LScope->getColumn());
                      } else if (DISubprogram *SScope =
                                     dyn_cast<DISubprogram>(presentScope)) {
                        scopeNode = currentMethodScopeNode;
                      }

                      // TODO: this is not an excellent way to do this, and
                      // makes assumptions about the structure of LLVM IR
                      if (DILexicalBlock *LB =
                              dyn_cast<DILexicalBlock>(BI->getSuccessor(0)
                                                           ->getFirstNonPHI()
                                                           ->getDebugLoc()
                                                           ->getScope())) {
                        controlledScope =
                            addUniqueNewNode("Scope", "--", LB->getFilename(),
                                             LB->getLine(), LB->getColumn());
                      }
                    } else if (loopOwner->getParent()->size() == 4) {
                      // For3Loops seem to always have 4 instructions in their
                      // loop Blocks
                      // TODO: check more cases since this is really sus
                      // DANGER: sus
                      controlStructureNode =
                          addUniqueNewNode("For3Loop", "--", Loc->getFilename(),
                                           Loc->getLine(), Loc->getColumn());

                      Loc = cast<DILocation>(
                          loopOwner->getMetadata(StringRef("llvm.loop"))
                              ->getOperand(1));

                      DILexicalBlock *initializerScope =
                          cast<DILexicalBlock>(Loc->getScope());
                      nodeSQM initializerScopeNode = addUniqueNewNode(
                          "ForInitial", "--", initializerScope->getFilename(),
                          initializerScope->getLine(),
                          initializerScope->getColumn());

                      addUniqueNewEdge(controlStructureNode.numericID,
                                       initializerScopeNode.numericID,
                                       controlStructureNode.numericID,
                                       "Member");
                      addUniqueNewEdge(initializerScopeNode.numericID,
                                       controlStructureNode.numericID,
                                       controlStructureNode.numericID,
                                       "MemberOf");

                      // dig past the scope containing the initializer thing
                      DILocalScope *presentScope = initializerScope->getScope();

                      if (DILexicalBlock *LScope =
                              dyn_cast<DILexicalBlock>(presentScope)) {
                        scopeNode = addUniqueNewNode(
                            "Scope", "--", LScope->getFilename(),
                            LScope->getLine(), LScope->getColumn());
                      } else if (DISubprogram *SScope =
                                     dyn_cast<DISubprogram>(presentScope)) {
                        scopeNode = currentMethodScopeNode;
                      }

                      // TODO: this is not an excellent way to do this, and
                      // makes assumptions about the structure of LLVM IR
                      if (DILexicalBlock *LB =
                              dyn_cast<DILexicalBlock>(scopeSearchBlock->back().getDebugLoc()->getScope())) {
                        controlledScope =
                            addUniqueNewNode("Scope", "--", LB->getFilename(),
                                             LB->getLine(), LB->getColumn());
                      }

                    } else {
                      // no clue how to identify while loops as-is
                      // TODO: clarify?
                      controlStructureNode =
                          addUniqueNewNode("While", "--", Loc->getFilename(),
                                           Loc->getLine(), Loc->getColumn());
                      // TODO: this is not an excellent way to do this, and
                      // makes assumptions about the structure of LLVM IR
                      if (loopOwner->getParent()->size() > 1) {
                        scopeSearchBlock = loopOwner->getParent();
                      }
                      if (DILexicalBlock *LB =
                              dyn_cast<DILexicalBlock>(scopeSearchBlock->front()
                                                           .getDebugLoc()
                                                           ->getScope())) {
                        controlledScope =
                            addUniqueNewNode("Scope", "--", LB->getFilename(),
                                             LB->getLine(), LB->getColumn());
                      }
                    }
                  }
                  // TODO: remove if statement when each block has a
                  // controlledScope defined
                  addUniqueNewEdge(controlStructureNode.numericID,
                                   controlledScope.numericID,
                                   controlStructureNode.numericID, "Member");
                  addUniqueNewEdge(controlledScope.numericID,
                                   controlStructureNode.numericID,
                                   controlStructureNode.numericID, "MemberOf");
                }

                // get CandidateRead and Check edges
                // TODO: look at what the statements for these should be...
                Value *condition = BI->getCondition();
                if (CmpInst *check = dyn_cast<CmpInst>(condition)) {
                  CmpInst::Predicate pred = check->getPredicate();
                  // focusing on integer compares only for now
                  // not sure how this checks other stuff...
                  // what's up with NullCheck and TypeCheck?
                  bool hasLiteral = false;
                  std::vector<nodeSQM> compNodes;
                  for (Use &op : check->operands()) {
                    if (Constant *lit = dyn_cast<Constant>(op)) {
                      hasLiteral = true;
                      compNodes.push_back(nonStringLiteralFinder(BI, op));
                    } else {
                      compNodes.push_back(fieldParameterFinder(op));
                    }
                  }
                  if (std::all_of(
                          compNodes.begin(), compNodes.end(),
                          [](nodeSQM node) { return !node.isEmpty(); })) {
                    switch (pred) {
                    case 32:
                    case 33:
                      // LiteralCheck or EqualityCheck (or NullCheck?)
                      if (hasLiteral) {
                        // if there is a node with nodeIdentifier Literal and name NULL, nullcheck instead
                        // TODO: use a more clever find function maybe
                        bool hasNull = false;
                        for (nodeSQM node : compNodes) {
                          if (node.nodeIdentifier == "Literal" &&
                              node.name == "NULL") {
                            hasNull = true;
                          }
                        }

                        std::string checkKind =
                            hasNull ? "NullCheck" : "LiteralCheck";

                        for (nodeSQM node : compNodes) {
                          addUniqueNewEdge(
                              node.numericID, controlStructureNode.numericID,
                              controlStructureNode.numericID, checkKind);
                          addUniqueNewEdge(
                              controlStructureNode.numericID, node.numericID,
                              controlStructureNode.numericID, "CandidateRead");
                        }
                      } else {
                        for (nodeSQM node : compNodes) {
                          addUniqueNewEdge(
                              node.numericID, controlStructureNode.numericID,
                              controlStructureNode.numericID, "EqualityCheck");
                          addUniqueNewEdge(
                              controlStructureNode.numericID, node.numericID,
                              controlStructureNode.numericID, "CandidateRead");
                        }
                      }
                      break;
                    case 34:
                    case 35:
                    case 36:
                    case 37:
                    case 38:
                    case 39:
                    case 40:
                    case 41:
                      // Literal and Compare Boundary
                      if (hasLiteral) {
                        for (nodeSQM node : compNodes) {
                          addUniqueNewEdge(node.numericID,
                                           controlStructureNode.numericID,
                                           controlStructureNode.numericID,
                                           "LiteralBoundary");
                          addUniqueNewEdge(
                              controlStructureNode.numericID, node.numericID,
                              controlStructureNode.numericID, "CandidateRead");
                        }
                      } else {
                        for (nodeSQM node : compNodes) {
                          addUniqueNewEdge(node.numericID,
                                           controlStructureNode.numericID,
                                           controlStructureNode.numericID,
                                           "CompareBoundary");
                          addUniqueNewEdge(
                              controlStructureNode.numericID, node.numericID,
                              controlStructureNode.numericID, "CandidateRead");
                        }
                      }
                      break;
                    default:
                      for (nodeSQM node : compNodes) {
                        // Control maybe?
                        addUniqueNewEdge(
                            node.numericID, controlStructureNode.numericID,
                            controlStructureNode.numericID, "Control");
                        addUniqueNewEdge(
                            controlStructureNode.numericID, node.numericID,
                            controlStructureNode.numericID, "CandidateRead");
                      }
                      break;
                    }
                  }
                } else if (CastInst *CI = dyn_cast<CastInst>(condition)) {
                    // TODO: check this out a little more
                    // CONTROL edge goes here, for the whilenests
                  Value *check = CI->getOperand(0);
                  if (LoadInst *LI = dyn_cast<LoadInst>(check)) {
                    nodeSQM node = fieldParameterFinder(LI->getPointerOperand());
                    addUniqueNewEdge(node.numericID,
                                     controlStructureNode.numericID,
                                     controlStructureNode.numericID, "Control");
                    addUniqueNewEdge(
                        controlStructureNode.numericID, node.numericID,
                        controlStructureNode.numericID, "CandidateRead");
                  }

                }


                addUniqueNewEdge(scopeNode.numericID,
                                 controlStructureNode.numericID,
                                 scopeNode.numericID, "Member");
                addUniqueNewEdge(controlStructureNode.numericID,
                                 scopeNode.numericID, scopeNode.numericID,
                                 "MemberOf");
              }
            }
          }

          // TODO: test this
          // currently might pick up useless scopes
          // for now, it will be hardcoded to only apply to checked instructions
          if (isa<ReturnInst>(&*IB) || isa<StoreInst>(&*IB) ||
              isa<CallBase>(&*IB) || isa<SwitchInst>(&*IB) ||
              isa<SelectInst>(&*IB)) {
            bool callBaseIntrinsicCheck = true;
            if (CallBase *CB = dyn_cast<CallBase>(&*IB)) {
              if (CB->getCalledFunction() != NULL) {
                if (CB->getCalledFunction()->isIntrinsic()) {
                    // skip intrinsic functions
                  callBaseIntrinsicCheck = false;
                }
              }
            }
            if (callBaseIntrinsicCheck) {
              if (DILocation *Loc = IB->getDebugLoc()) {
                if (isa<DILexicalBlock>(Loc->getScope())) {
                  scopeNode = branchScopeSpecifier(&*IB);
                }
              }
            }
          }
          // strings do not use storeInsts - they use calls and invokes instead
          if (ReturnInst *RI = dyn_cast<ReturnInst>(&*IB)) {
            Value *retValue = RI->getReturnValue();
            //TODO: rewrite the returnValue stuff to make it less copy-paste dependent
            // right now this is bad practice and not super safe
            // especially since the vast majority of these things have existing functions to get nodes
            // and returns only care about specific EDGES
            // one thing to consider - a return's value (since it's pushed away thru loads, stores) does NOT have a dbgdeclare!

            if (CastInst *CI = dyn_cast_or_null<CastInst>(retValue)) {
              retValue = CI->getOperand(0);
            }

            // somehow string returns are fucked to shit
            // they return a void for whatever reason
            // the dyn_cast breaks on voids so change to _or_null
            if (BinaryOperator *BO =
                    dyn_cast_or_null<BinaryOperator>(retValue)) {
              //returnBinaryOperatorRecurseNodeGenerator(BO, currentMethodNode.numericID, scopeNode.numericID);

              std::vector<nodeSQM> retVec = binaryOperatorRecurseNodeGenerator(BO);
              for (nodeSQM uniqueFieldNode : retVec) {
                addUniqueNewEdge(currentMethodNode.numericID,
                                 uniqueFieldNode.numericID, scopeNode.numericID,
                                 "ReturnValue");
              }

            } else if (LoadInst *LI = dyn_cast_or_null<LoadInst>(retValue)) {
              nodeSQM uniqueFieldNode =
                  fieldParameterFinder(LI->getPointerOperand());
              if (!uniqueFieldNode.isEmpty()) {
                addUniqueNewEdge(currentMethodNode.numericID,
                                 uniqueFieldNode.numericID, scopeNode.numericID,
                                 "ReturnValue");
              } else {
                for (User *U : LI->getPointerOperand()->users()) {
                  if (Instruction *UI = dyn_cast<Instruction>(U)) {
                    if (DILocation *UILoc = UI->getDebugLoc()) {
                      if (StoreInst *USI = dyn_cast<StoreInst>(UI)) {
                        auto [writtenVec, imaginaryField] =
                            storeInstFieldNodeGenerator(USI);
                        if (isa<DILexicalBlock>(UILoc->getScope())) {
                          scopeNode = branchScopeSpecifier(USI);
                        }
                        for (nodeSQM uniqueFieldNode : writtenVec) {
                          if (!uniqueFieldNode.isEmpty()) {
                            addUniqueNewEdge(currentMethodNode.numericID,
                                             uniqueFieldNode.numericID,
                                             scopeNode.numericID,
                                             "ReturnValue");
                          }
                        }
                      } else {
                        if (UI != LI) {
                          // can UI be anything but this instruction and a storeInst?
                          errs() << "FUNKY RET\a\n";
                          UI->dump();
                        }
                      }
                    }
                  }
                }
              }
              
            } else if (PHINode *PN = dyn_cast_or_null<PHINode>(retValue)) {
                // DANGER: copied from storeInst-function
                // TODO: maybe func this?
              for (int i = 0; i < PN->getNumIncomingValues(); i++) {
                Value *incoming = PN->getIncomingValue(i);
                if (Constant *inConst = dyn_cast<Constant>(incoming)) {
                  if (BranchInst *BI = dyn_cast<BranchInst>(
                          PN->getIncomingBlock(i)->getTerminator())) {
                    if (BI->isConditional()) {
                      incoming = BI->getCondition();
                    } else if (incoming == NULL) {
                      // not clear how to handle this - returning a nullptr directly isn't clear to me
                      // TODO: resolve this
                      errs() << "NULL POINTER\a\n";
                    }
                    
                  }
                }
                if (CastInst *CI = dyn_cast<CastInst>(incoming)) {
                  incoming = CI->getOperand(0);
                }
                if (LoadInst *LI = dyn_cast<LoadInst>(incoming)) {
                    nodeSQM uniqueFieldNode =
                        fieldParameterFinder(LI->getPointerOperand());
                    addUniqueNewEdge(currentMethodNode.numericID,
                                     uniqueFieldNode.numericID,
                                     scopeNode.numericID, "ReturnValue");
                } else if (CallBase *CB = dyn_cast<CallBase>(incoming)) {
                  for (Use &op : CB->args()) {
                    if (GetElementPtrInst *GEP =
                            dyn_cast<GetElementPtrInst>(op)) {
                      nodeSQM uniqueFieldNode = classFieldNodeGEP(GEP);
                      addUniqueNewEdge(currentMethodNode.numericID,
                                       uniqueFieldNode.numericID,
                                       scopeNode.numericID, "ReturnValue");
                    }
                  }
                } else if (CmpInst *CMP = dyn_cast<CmpInst>(incoming)) {
                  for (Use &op : CMP->operands()) {
                    if (LoadInst *LI = dyn_cast<LoadInst>(op)) {
                      if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(
                              LI->getPointerOperand())) {
                        nodeSQM uniqueFieldNode =
                            classFieldNodeGEP(GEP);
                        addUniqueNewEdge(currentMethodNode.numericID,
                                         uniqueFieldNode.numericID,
                                         scopeNode.numericID, "ReturnValue");
                      }
                    }
                  }
                }
              }
            }
            // TODO: maybe do an else if and try dyncasting this to Constant
            if (retValue) {
              // on-the-spot, no-load literal
              nodeSQM directLiteralNode =
                  nonStringLiteralFinder(&*IB, retValue);
              if (!directLiteralNode.isEmpty()) {
                addUniqueNewEdge(currentMethodNode.numericID,
                                 directLiteralNode.numericID,
                                 scopeNode.numericID, "ReturnValue");
              }
            }
            
          }

          // StoreInsts
          if (StoreInst *SI = dyn_cast<StoreInst>(&*IB)) {

            auto [writtenVec, uniqueMemberNode] = storeInstFieldNodeGenerator(SI);

            // when multiple things read and write, ie binOps:
            // for each non-empty writtenNode, add the edges
            for (nodeSQM writtenNode : writtenVec) {
              // may change as non-literals are figured out
              if (!uniqueMemberNode.isEmpty() && !writtenNode.isEmpty()) {
                addUniqueNewEdge(uniqueMemberNode.numericID,
                                 writtenNode.numericID, scopeNode.numericID,
                                 "WrittenBy");
                addUniqueNewEdge(writtenNode.numericID,
                                 uniqueMemberNode.numericID,
                                 scopeNode.numericID, "CandidateRead");
              }
            }
            
          }

          // calls?
          // callbase covers calls and invokes so use that
          // may be useable for both string literals and actual function calls
          if (CallBase *CB = dyn_cast<CallBase>(&*IB)) {
              // slightly odd - there seem to be circumstances where a call doesn't call a function??
              // TODO: learn about this
            if (Function *calledFunction =
                    dyn_cast_or_null<Function>(CB->getCalledFunction())) {
              DISubprogram *CBS = calledFunction->getSubprogram();
              if (!calledFunction->isIntrinsic()) {
                // errs() << "\nCB: " << *CB << "\n";

                // for (Use &arg : CB->args()) {
                //  errs() << "ARG:  " << *arg << "\n";
                //}

                if (calledFunction->isVarArg() &&
                    calledFunction->arg_size() < CB->arg_size()) {
                  errs() << "VAR ARGS\a\n";
                  errs() << calledFunction->arg_size() << "\n";
                  errs() << CB->arg_size() << "\n";

                  for (int i = calledFunction->arg_size(); i < CB->arg_size();
                       i++) {
                    CB->getArgOperand(i)->dump();
                  }
                }   

                // note that it seems formal parameters do not exist
                // in LLVM for declared functions with no definition, so things
                // which have CBS == NULL won't have those edges
                if (CBS && !CBS->isArtificial()) {
                  // errs() << "NAME: " << CBS->getScope()->getName() << "\n";
                  // try to get string assignments
                  // very very awful way of doing this!
                  // TODO: make this less horrible! also make more generally
                  // useable
                  if (CBS->getScope()->getName() ==
                          "basic_string<char,std::char_traits<char>,std::"
                          "allocator<"
                          "char> >" &&
                      CB->getNumArgOperands() >= 2) {
                    // for literals
                    // 0th arg is alloca - that's the field
                    nodeSQM uniqueFieldNode =
                        fieldParameterFinder(CB->getArgOperand(0));
                    // 1st arg is getelementptr - that's a string literal
                    nodeSQM stringLiteralNode =
                        stringLiteralFinder(CB->getArgOperand(1), &*IB);

                    // class field assignment stuff
                    if (uniqueFieldNode.isEmpty() &&
                        stringLiteralNode.isEmpty()) {
                      // 0th arg is getelementptr inbounds to the class
                      // 1st arg is a pointer to a string
                      if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(
                              CB->getArgOperand(0))) {
                        uniqueFieldNode = classFieldNodeGEP(GEP);
                        // errs() << uniqueFieldNode << "\n";
                      }
                      stringLiteralNode =
                          fieldParameterFinder(CB->getArgOperand(1));
                      // errs() << stringLiteralNode << "\n";
                    }

                    if (!uniqueFieldNode.isEmpty() &&
                        !stringLiteralNode.isEmpty()) {
                      addUniqueNewEdge(uniqueFieldNode.numericID,
                                       stringLiteralNode.numericID,
                                       scopeNode.numericID, "WrittenBy");
                      addUniqueNewEdge(stringLiteralNode.numericID,
                                       uniqueFieldNode.numericID,
                                       scopeNode.numericID, "CandidateRead");
                    }
                  }
                  // set this if statement depending on whether or not you want
                  // other stuff used, like the standard library stuff
                  // CBS->getDirectory().find(nodeSQM::getCurrentPath()) != std::string::npos
                  // true
                  // PATHEXCLUSION
                  if (true) {
                    // access edges come from here!
                    // TODO: connect actual parameters to formal parameters
                    // for Access types, probably will need to skip the first
                    // parameter

                    // moved calledFuntionNode to here from inside that if below
                    // TODO: test that this is OK and not fucked up
                    nodeSQM calledFunctionNode = subprogramNodeGenerator(CBS);
                    if (calledFunction->getParamDereferenceableBytes(0) != 0) {
                      
                      Value *argThing = CB->getArgOperand(0);

                      nodeSQM uniqueFieldNode = fieldParameterFinder(argThing);
                      // TODO: make sure this is all fine and good
                      // right now this removes the operator== accesses as
                      // expected, but care should be taken to make sure nothing
                      // was wrongly removed
                      // && isa<DICompositeType>(CBS->getScope())
                      if (calledFunctionNode.nodeIdentifier != "Constructor" &&
                          !uniqueFieldNode.isEmpty() &&
                          isa<DICompositeType>(CBS->getScope())) {
                        addUniqueNewEdge(uniqueFieldNode.numericID,
                                         calledFunctionNode.numericID,
                                         scopeNode.numericID, "Accesses");
                        addUniqueNewEdge(calledFunctionNode.numericID,
                                         uniqueFieldNode.numericID,
                                         scopeNode.numericID, "CandidateRead");
                      }

                      // sret read/write edges here
                      // TODO: check this out more
                      // may want to move out and up to the getDirectory scope
                      // this assumes paramDerefs which may not be the case..!
                      if (calledFunction->hasStructRetAttr()) {
                        for (int argPos = 0; argPos < 2; argPos++) {
                          if (calledFunction->getParamStructRetType(argPos)) {
                            // get pointer of argument
                            nodeSQM writtenNode =
                                fieldParameterFinder(CB->getOperand(argPos));
                            if (!writtenNode.isEmpty()) {
                              addUniqueNewEdge(writtenNode.numericID,
                                               calledFunctionNode.numericID,
                                               scopeNode.numericID,
                                               "WrittenBy");
                              addUniqueNewEdge(calledFunctionNode.numericID,
                                               writtenNode.numericID,
                                               scopeNode.numericID,
                                               "CandidateRead");
                            }
                          }
                        }
                      }

                    }

                    // try to connect actual params to formal ones
                    // TODO: make this less god-awful
                    // maybe look at DISubroutineType...?
                    for (Function::arg_iterator
                             argB = calledFunction->arg_begin(),
                             argE = calledFunction->arg_end();
                         argB != argE; ++argB) {
                      // errs() << "Operand Check\n";
                      unsigned argNo = argB->getArgNo();
                      // argB->dump();
                      // TODO: check the procedure for string literals
                      // argB is some kind of % identifier
                      // actualParam is an alloca
                      Value *actualParam = CB->getArgOperand(argNo);
                      //actualParam->dump();

                      // doing the finddbgdeclare block on argB gives the formal
                      // param node we want (for string literals specifically,
                      // seems like other stuff is taken care of below)

                      nodeSQM formalParameterNode = fieldParameterFinder(argB);
                      // errs() << formalParameterNode << "\n";

                      // TODO: this vvv
                      // actualParam should be something like:
                      // get users of this alloca - should be a callbase
                      // containing a constantexpr. "most recent" call is
                      // possibly the right one also since users() seems to
                      // iterate backwards crack open the callbase user that has
                      // this alloca as a parameter. get the getelementptr from
                      // this in the usual way?

                      // annoyingly, there is no easy way to get the first user
                      // in any case, the first user should be the assignment
                      nodeSQM actualParameterNode;
                      actualParam->reverseUseList();
                      // errs() << "Final: " << *(actualParam->user_back()) <<
                      // "\n"; errs() << "OPCOUNT: " <<
                      // actualParam->user_back()->getNumOperands() << "\n";
                      if (Instruction *firstUser =
                              dyn_cast<Instruction>(actualParam->user_back())) {
                        if (firstUser->getNumOperands() >= 2) {
                          actualParameterNode = stringLiteralFinder(
                              firstUser->getOperand(1), firstUser);
                          //errs() << actualParameterNode << "\n";
                        }
                      }

                      // actualParam can straight-up be a valid ConstantExpr
                      // for string Literals
                      if (ConstantExpr *CE =
                              dyn_cast<ConstantExpr>(actualParam)) {
                        actualParameterNode = stringLiteralFinder(CE, CB);
                      }

                      // TODO: cut this, move below
                      if (!formalParameterNode.isEmpty() &&
                          !actualParameterNode.isEmpty()) {
                        addUniqueNewEdge(formalParameterNode.numericID,
                                         actualParameterNode.numericID,
                                         scopeNode.numericID, "WrittenBy");
                        addUniqueNewEdge(actualParameterNode.numericID,
                                         formalParameterNode.numericID,
                                         scopeNode.numericID, "CandidateRead");
                      }

                      // argB is used by a storeInst
                      // want the name of that pointer! - that's the parameter!
                      for (User *user : argB->users()) {

                        Value *targetedValue = user;

                        // TODO: find out what this is for
                        if (CastInst *CI = dyn_cast<CastInst>(targetedValue)) {
                          CI->reverseUseList();
                          //for (User *castUser : CI->users()) {
                          //  targetedValue = castUser;
                          //  break;
                          //}
                          targetedValue = CI->user_back();
                        }

                        if (StoreInst *SI =
                                dyn_cast<StoreInst>(targetedValue)) {
                          auto [literalVec, formalParameterNode] =
                              storeInstFieldNodeGenerator(SI);
                          //errs() << formalParameterNode << "\n";

                          // fields vs literals should be considered also

                          // assumes a LoadInst, CallBase, or BinaryOperator
                          // look into other cases for this!
                          // TODO: consider messing with the StoreInst node function...
                          // the guts of that may be usable here too
                          if (LoadInst *LI = dyn_cast<LoadInst>(actualParam)) {
                            actualParameterNode =
                                fieldParameterFinder(LI->getPointerOperand());
                          } else if (CallBase *ICB =
                                         dyn_cast<CallBase>(actualParam)) {
                            if (!ICB->isIndirectCall()) {
                              DISubprogram *ICBS =
                                  ICB->getCalledFunction()->getSubprogram();
                              if (ICBS) {
                                actualParameterNode =
                                    subprogramNodeGenerator(ICBS);
                              } else {
                                actualParameterNode = undefinedFunctionNodes(ICB->getCalledFunction())[0];
                              }
                            } else {
                              // TODO: missing stuff here
                              // this is where that polygon area stuff
                              // happens... it may not be possible to pull names
                              // from indirect calls like this
                              errs() << "Indirect Call\a\n";
                              ICB->getCalledOperand()->dump();
                            }
                          } else if (BinaryOperator *BO =
                                         dyn_cast<BinaryOperator>(
                                             actualParam)) {
                            std::vector<nodeSQM> writeVec = binaryOperatorRecurseNodeGenerator(BO);

                            if (!formalParameterNode.isEmpty()) {
                              for (nodeSQM node : writeVec) {
                                if (!node.isEmpty()) {
                                  addUniqueNewEdge(
                                      formalParameterNode.numericID,
                                      node.numericID,
                                      scopeNode.numericID, "WrittenBy");
                                  addUniqueNewEdge(
                                      node.numericID,
                                      formalParameterNode.numericID,
                                      scopeNode.numericID, "CandidateRead");
                                }
                              }
                            }
                          }

                          // if the field nodes don't work, look for literals!
                          // TODO: literal strings
                          if (actualParameterNode.isEmpty()) {
                            actualParameterNode =
                                nonStringLiteralFinder(CB, actualParam);
                          }

                          // TODO: cut this, move below
                          if (!formalParameterNode.isEmpty() &&
                              !actualParameterNode.isEmpty()) {
                            addUniqueNewEdge(formalParameterNode.numericID,
                                             actualParameterNode.numericID,
                                             scopeNode.numericID, "WrittenBy");
                            addUniqueNewEdge(actualParameterNode.numericID,
                                             formalParameterNode.numericID,
                                             scopeNode.numericID,
                                             "CandidateRead");
                          }
                        }
                      }
                    }

                                     

                  }
                } else if (CBS == NULL) {
                  std::vector<nodeSQM> undefinedFunctionNodesVec = undefinedFunctionNodes(calledFunction);
                  //DANGER: copied from above section...
                  // TODO:? functionize this and the above
                  // it may be possible and worthwhile to chop up that StoreInst
                  // function to reuse the identification code from there
                  for (Function::arg_iterator
                           argB = calledFunction->arg_begin(),
                           argE = calledFunction->arg_end();
                       argB != argE; ++argB) {
                    unsigned argNo = argB->getArgNo();

                    Value *actualParam = CB->getArgOperand(argNo);

                    nodeSQM formalParameterNode = undefinedFunctionNodesVec[argNo+1];

                    while (CastInst *CI = dyn_cast<CastInst>(actualParam)) {
                      actualParam = CI->getOperand(0);
                    }

                    nodeSQM actualParameterNode;

                    if (LoadInst *LI = dyn_cast<LoadInst>(actualParam)) {
                      actualParameterNode =
                          fieldParameterFinder(LI->getPointerOperand());
                    } else if (CallBase *ICB = dyn_cast<CallBase>(actualParam)) {
                      if (!ICB->isIndirectCall()) {
                        DISubprogram *ICBS =
                            ICB->getCalledFunction()->getSubprogram();
                        if (ICBS) {
                          actualParameterNode = subprogramNodeGenerator(ICBS);
                        } else {
                          actualParameterNode = undefinedFunctionNodes(
                              ICB->getCalledFunction())[0];
                        }
                      } else {
                        // TODO: missing stuff here
                        // this is where that polygon area stuff
                        // happens... it may not be possible to pull names
                        // from indirect calls like this
                        errs() << "Indirect Call\a\n";
                        ICB->getCalledOperand()->dump();
                      }
                    } else if (BinaryOperator *BO =
                                   dyn_cast<BinaryOperator>(actualParam)) {
                      std::vector<nodeSQM> writeVec =
                          binaryOperatorRecurseNodeGenerator(BO);

                      if (!formalParameterNode.isEmpty()) {
                        for (nodeSQM node : writeVec) {
                          if (!node.isEmpty()) {
                            addUniqueNewEdge(formalParameterNode.numericID,
                                             node.numericID,
                                             scopeNode.numericID, "WrittenBy");
                            addUniqueNewEdge(
                                node.numericID, formalParameterNode.numericID,
                                scopeNode.numericID, "CandidateRead");
                          }
                        }
                      }
                    }

                    // if the field nodes don't work, look for literals!
                    // TODO: literal strings
                    if (actualParameterNode.isEmpty()) {
                      actualParameterNode =
                          nonStringLiteralFinder(CB, actualParam);
                    }

                    // TODO: cut this, move below
                    if (!formalParameterNode.isEmpty() &&
                        !actualParameterNode.isEmpty()) {
                      addUniqueNewEdge(formalParameterNode.numericID,
                                       actualParameterNode.numericID,
                                       scopeNode.numericID, "WrittenBy");
                      addUniqueNewEdge(actualParameterNode.numericID,
                                       formalParameterNode.numericID,
                                       scopeNode.numericID, "CandidateRead");
                    }

                  }
                }

                // get list of attributes in this call

                // for (AttributeSet AS : CB->getAttributes()) {
                //  // get set of attributes from list
                //  errs() << "AttSet\n";
                //  for (Attribute A : AS) {
                //      // get attributes from set
                //    errs() << A.getAsString() << "\n";
                //    errs() << A.isEnumAttribute() << A.isIntAttribute() <<
                //    A.isStringAttribute() << A.isTypeAttribute() << "\n";
                //  }
                //}

                // TODO: pull out parameter attributes
                // want to see dereferenceable!
                // dereferenceable is an integer attribute
                // want this on operand 0
                // or... argument 1?

                // looks like you could ignore things which have nounwind in
                // their first attset the relevant dereferenceable seems to
                // always be in the last attset find a way to check derefs in
                // the first argument/parameter specifically as expected, negate
                // has no derefs -> this stuff does point to a load, though!
              }
            }
          }

          // switch statement node
          if (SwitchInst *SI = dyn_cast<SwitchInst>(&*IB)) {
            if (DILocation *Loc = IB->getDebugLoc()) {
              nodeSQM controlStructureNode =
                  addUniqueNewNode("Switch", "--", Loc->getFilename(),
                                   Loc->getLine(), Loc->getColumn());

              // membership in the scope
              addUniqueNewEdge(scopeNode.numericID,
                               controlStructureNode.numericID,
                               scopeNode.numericID, "Member");
              addUniqueNewEdge(controlStructureNode.numericID,
                               scopeNode.numericID, scopeNode.numericID,
                               "MemberOf");

              // TODO: check if this is the correct scope
              // Control node for this switch
              nodeSQM controlNode = fieldParameterFinder(SI->getCondition());
              addUniqueNewEdge(controlNode.numericID,
                               controlStructureNode.numericID,
                               controlStructureNode.numericID, "Control");
              addUniqueNewEdge(controlStructureNode.numericID,
                               controlNode.numericID,
                               controlStructureNode.numericID, "CandidateRead");

              // the DILocation for the end of the scope bracket is associated
              // with the exit branch of the default dest, or so it seems
              //SI->getDefaultDest()->back().getDebugLoc()->getScope()->dump();
              // TODO: this is not an excellent way to do this, and
              // makes assumptions about the structure of LLVM IR
              if (DILexicalBlock *LB = dyn_cast<DILexicalBlock>(
                      SI->getDefaultDest()->back().getDebugLoc()->getScope())) {
                nodeSQM controlledScope =
                    addUniqueNewNode("Scope", "--", LB->getFilename(),
                                     LB->getLine(), LB->getColumn());

                addUniqueNewEdge(controlStructureNode.numericID,
                                 controlledScope.numericID,
                                 controlStructureNode.numericID, "Member");
                addUniqueNewEdge(controlledScope.numericID,
                                 controlStructureNode.numericID,
                                 controlStructureNode.numericID, "MemberOf");
              }
            }
          }

          // trinary node
          // warning: select instruction has extended use with vectors - may not
          // be "trinary"
          // TODO: get RightScope and WrongScope from this...
          // ^^ look at SelectInst's getTrueValue(), getFalseValue()
          // https://llvm.org/doxygen/classllvm_1_1SelectInst.html
          // also note the existence of PHINode-based trinaries, which are handled above in BranchInst section
          if (SelectInst *TRI = dyn_cast<SelectInst>(&*IB)) {
            DILocation *Loc = IB->getDebugLoc();
            nodeSQM controlStructureNode =
                addUniqueNewNode("Trinary", "--", Loc->getFilename(),
                                 Loc->getLine(), Loc->getColumn());

            // membership in the scope
            addUniqueNewEdge(scopeNode.numericID,
                             controlStructureNode.numericID,
                             scopeNode.numericID, "Member");
            addUniqueNewEdge(controlStructureNode.numericID,
                             scopeNode.numericID, scopeNode.numericID,
                             "MemberOf");
            //TRI->getCondition()->dump();
            //TRI->getTrueValue()->dump();
            //TRI->getFalseValue()->dump();
          }

          

        }
      }
    }
  }

  // when you want a .gph file output, set this to true
  bool printGPHFile = true;

  if (printGPHFile) {
    std::string gphFileName =
        M.getName().str().substr(0, M.getName().find_last_of('.')) +
        ".gph";
    std::ofstream gphFile;
    gphFile.open(gphFileName);
    for (nodeSQM node : nodeSQM::getNodeVec()) {
      gphFile << node << "\n";
    }
    for (edgeSQM edge : edgeSQM::getEdgeVec()) {
      gphFile << edge << "\n";
    }
    gphFile.close();
  }

  // for Gephi-ready output, set this to true
  //TODO: modify this so the outputs show ALL the info
  // Nodes want Id,Label,Category,Module,NodePattern,AccessPattern,TypeName,File,StateMember,ClassID,Rank
  // Id is the numericID, Label is the name, Category is the nodeIdentifier
  // Module, NodePattern, AccessPattern are not clear; TypeName is also weird, File is filename,
  // StateMember isn't clear but it is always 0, ClassID is not clear, Rank is not clear but it's always -1
  // Edges want Source;Target;Label;Weight;EdgeFlag
  // Label is the edgeType, so that does not change
  // weight's not clear, and neither is EdgeFlag
  bool printCSVFiles = true;

  if (printCSVFiles) {
    std::string nodeFileName =
        M.getName().str().substr(0, M.getName().find_last_of('.')) +
        "Nodes.csv";
    std::ofstream nodeFile;
    nodeFile.open(nodeFileName);
    nodeFile << "Id;Label\n";
    for (nodeSQM node : nodeSQM::getNodeVec()) {
      nodeFile << node.numericID << ";" << node.nodeIdentifier << " "
               << node.name << "\n";
    }
    nodeFile.close();

    std::string edgeFileName =
        M.getName().str().substr(0, M.getName().find_last_of('.')) +
        "Edges.csv";
    std::ofstream edgeFile;
    edgeFile.open(edgeFileName);
    edgeFile << "Source;Target;Label\n";
    for (edgeSQM edge : edgeSQM::getEdgeVec()) {
      edgeFile << edge.nodeAID << ";" << edge.nodeBID << ";" << edge.edgeType << "\n";
    }
    edgeFile.close();
  }

  for (nodeSQM node : nodeSQM::getNodeVec()) {
    errs() << node << "\n";
  }
  for (edgeSQM edge : edgeSQM::getEdgeVec()) {
    errs() << edge << "\n";
  }
  return PreservedAnalyses::all();
}
