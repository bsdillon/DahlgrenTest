import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.bcel.classfile.Field;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.ALOAD;
import org.apache.bcel.generic.ASTORE;
import org.apache.bcel.generic.FieldInstruction;
import org.apache.bcel.generic.GETFIELD;
import org.apache.bcel.generic.IF_ICMPLT;
import org.apache.bcel.generic.INVOKESPECIAL;
import org.apache.bcel.generic.INVOKESTATIC;
import org.apache.bcel.generic.INVOKEVIRTUAL;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.MethodGen;
import org.apache.bcel.generic.PUTFIELD;

import edu.umd.cs.findbugs.BugReporter;
import edu.umd.cs.findbugs.SourceLineAnnotation;
import edu.umd.cs.findbugs.ba.CFG;
import edu.umd.cs.findbugs.ba.CFGBuilderException;
import edu.umd.cs.findbugs.ba.ClassContext;
import edu.umd.cs.findbugs.ba.DataflowAnalysisException;
import edu.umd.cs.findbugs.ba.Location;
import edu.umd.cs.findbugs.bcel.OpcodeStackDetector;

public class MyDetector extends OpcodeStackDetector {
    private final BugReporter bugReporter;
    private final File file;
    private final ArrayList<Field> fields;
    private final ArrayList<Method> methods;
    public MyDetector(BugReporter bugReporter) {
        this.bugReporter = bugReporter;
        fields = new ArrayList<Field>();
        methods = new ArrayList<Method>();
        file = new File("Spotbugs Output.txt");
        try {
        	if(!file.createNewFile()) {
        		if(file.delete())
        			file.createNewFile();
        		else
        			System.out.println("File was not deleted.");
        	}
        } catch (IOException e) {
        	System.out.println("IO error:");
        	e.printStackTrace();
        }
        
    }
    @Override
    public void visitField(Field obj) {
    	super.visitField(obj);
    	fields.add(obj);
    }
    @Override
    public void visitMethod(Method obj) {
    	super.visitMethod(obj);
    	methods.add(obj);
    }
    
    private void printToOutputFile(String output) {
    	try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter("Spotbugs Output.txt", true)))) {
    	    out.println(output);
    	} catch (IOException e) {
    	    System.err.println(e);
    	}
    }
    private static final boolean DEBUG = true;

    @Override
    public void visitClassContext(ClassContext classContext) {
        JavaClass javaClass = classContext.getJavaClass();

        Method[] methodList = javaClass.getMethods();

        for (Method method : methodList) {
            MethodGen methodGen = classContext.getMethodGen(method);
            if (methodGen == null) {
                continue;
            }

            try {
                analyzeMethod(classContext, method);
            } catch (DataflowAnalysisException e) {
                bugReporter.logError("Error analyzing " + method.toString(), e);
            } catch (CFGBuilderException e) {
                bugReporter.logError("Error analyzing " + method.toString(), e);
            }
        }
    }

    private void analyzeMethod(ClassContext classContext, Method method) throws DataflowAnalysisException, CFGBuilderException {
        if (DEBUG) {
            System.out.println("    Analyzing method " + classContext.getJavaClass().getClassName() + "." + method.getName());
        }

        JavaClass javaClass = classContext.getJavaClass();

        CFG cfg = classContext.getCFG(method);
        if (cfg.isFlagSet(CFG.FOUND_INEXACT_UNCONDITIONAL_THROWERS)) {
            return;
        }

        for (Iterator<Location> i = cfg.locationIterator(); i.hasNext();) {
        	Location location = i.next();
        	analyzeBytecode(location, classContext, method, javaClass.getSourceFileName());
        }
    }
    
    private void analyzeBytecode(Location location, ClassContext context, Method method, String sourceFile) {
    	SourceLineAnnotation sourceLineAnnotation = SourceLineAnnotation.fromVisitedInstruction(context, context.getMethodGen(method),
                sourceFile, location.getHandle());
        Instruction ins = location.getHandle().getInstruction();
        String s = "";
        s += location.toString() + ":\n";
        s += location.getClass().getTypeParameters() + "\n";
        s += ins.toString() + "\n";
    	if(ins instanceof GETFIELD) {
    		s += ((FieldInstruction) ins).getFieldName(context.getConstantPoolGen()) + "\n";
    	}
    	
    	if(ins instanceof ALOAD) {
    		s += ((ALOAD) ins).getType(context.getConstantPoolGen()).toString() + "\n";
    		s += ins.produceStack(context.getConstantPoolGen()) + "\n";
    		s += method.getLocalVariableTable() + "\n";
    	}
    	if(ins instanceof ASTORE) {
    		s += ((ASTORE) ins).getType(context.getConstantPoolGen()) + "\n";
    	}
    	if(ins instanceof INVOKESPECIAL) {
    		s += ((INVOKESPECIAL) ins).getMethodName(context.getConstantPoolGen()) + "\n";
    		s += ((INVOKESPECIAL) ins).getName(context.getConstantPoolGen()) + "\n";
    	}
    	if(ins instanceof INVOKESTATIC) {
    		s += ((INVOKESTATIC) ins).getArgumentTypes(context.getConstantPoolGen()) + "\n";
    		s += ((INVOKESTATIC) ins).getMethodName(context.getConstantPoolGen()) + "\n";
    		s += ((INVOKESTATIC) ins).getName(context.getConstantPoolGen()) + "\n";
    	}
    	if(ins instanceof INVOKEVIRTUAL) {
    		s += ((INVOKEVIRTUAL) ins).getArgumentTypes(context.getConstantPoolGen()) + "\n";
    		s += ((INVOKEVIRTUAL) ins).getMethodName(context.getConstantPoolGen()) + "\n";
    		s += ((INVOKEVIRTUAL) ins).getName(context.getConstantPoolGen()) + "\n";
    	}
    	if(ins instanceof IF_ICMPLT) {
    		s += ins.produceStack(context.getConstantPoolGen()) + "\n";
    	}
    	if(ins instanceof PUTFIELD) {
    		s += ((PUTFIELD) ins).getFieldName(context.getConstantPoolGen()) + "\n";
    	}
    	
    	s += "Position: "+ sourceLineAnnotation.getStartLine() + "\n";
    	printToOutputFile(s);
    }

	@Override
	public void sawOpcode(int seen) {
		// TODO Auto-generated method stub
		
	}
}