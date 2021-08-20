library(tidyverse)
library(igraph)
library(tictoc)

# runs everything
mainAlgorithm <- function() {
    # minimum gain needed to continue iterating 
    minDiff <- 0.00001 
    
    # get initial modularity
    q1 <- CalcModularityQ()
    if(debug) {
        print(paste0("initial mod: ", q1))   
    }
    # forces first iteration (in while loop q0 - q1 will be greater than minDiff)
    q0 <- q1 + 1 
    iteration <- 0
    
    # another way to keep track of continuation
    graphRevised <- FALSE
    
    # iterate until no modularity differences occur
    while(abs(q0 - q1) > minDiff | graphRevised) {
        iteration <- iteration + 1
        graphRevised <- FALSE
        # update last measure of modularity
        q0 <- q1
        # attempt to combine modules 
        graphRevised = combineModules(FALSE)
        # recalculate modularity
        q1 <- CalcModularityQ()
        if(debug){
            print(paste0("q1: ", q1))
            print(paste0("iteration: ", iteration))
            if (iteration == 4) {
              return(iteration)
            }   
        }
    }
    print(paste0("final Modularity: ", q1))
    print(paste0("final modules: ", 1))
    answer <- finalModules()
    anTrim <- answer[ answer != 0 ]
    print(anTrim)
    
}

# actual calculation of Q value 
finalModules <- function() {
    # empty list of size Modules
    modList <- integer(length(modules))
    print(modList)
        
    # cycle through all node_list NOT VERY EFFICIENT 
    for (first in node_list$V1) {
        # get the first node_list module
        mod1 <- node_list[first, 2]
        
        # get all linked node_list to current node using adjacency matrix
        lN_list <- which(AM[first, ] != 0, arr.ind = FALSE)
        
        # check modularity with all node_list 
        for (second in lN_list) {
            # don't want to look at same node
            if (second != first) {
                # get the second node_list module
                mod2 <- node_list[second, 2]
                # value of 1 new edge we look for (weight depends on module connection?)
                qVal <- AM[first, second]
                # inter module connection 
                if (mod2 == mod1){
                    # add to counter of edges within a module
                    modList[[mod1]] <- modList[[mod1]] + c(qVal)
                }
            }
            
        }
    }
  
    return(modList)
}

# actual calculation of Q value 
CalcModularityQ <- function() {
    # initialize variables
    mValue <- 0
    sum <- 0
    
    # cycle through all node_list NOT VERY EFFICIENT 
    for (first in node_list$V1) {
        # get the first node_list module
        mod1 <- node_list[first, 2]
        
        # get all linked node_list to current node using adjacency matrix
        lN_list <- which(AM[first, ] != 0, arr.ind = FALSE)
        
        # check modularity with all node_list 
        for (second in lN_list) {
            # don't want to look at same node
            if (second != first) {
                # get the second node_list module
                mod2 <- node_list[second, 2]
                # value of 1 new edge we look for (weight depends on module connection?)
                qVal <- AM[first, second]
                # total num of edges that exist
                mValue <- mValue + qVal
                # inter module connection 
                if (mod2 == mod1){
                    # add to counter of edges within a module
                    sum <- sum + qVal 
                }
            }
            
        }
        node_list <<- node_list
    }
    # ratio of edges inside of modules to total edges 
    return(as.double(sum/mValue))
}

# myopic view of Q value   
# returns positive num if advantage, negative num if joining should be reversed, 0 if no advantage
CalcShortQ <- function(firstNode, secondNode) {
    # get number of the module each node is connected to
    firstModule <<- node_list[firstNode, 2]
    secondModule <- node_list[secondNode, 2]
    
    firstModuleDelta <- 0
    secondModuleDelta <- 0 
    
    if (debug) {
        print(paste0("first group: ", modules[[firstModule]]))
    }
    if (length(modules[[firstModule]]) > 0) {
        for (firstModNode in modules[[firstModule]]) {
            # update for lost links when we move module n1 to new module
            # skip the same node 
            if (firstModNode != firstNode) {
                # update the firstModuleDelta negatively because links are lost
                # get directed link through an adjacency matrix
                #print(c(-1, firstNode, firstModNode, -AM[firstModNode,firstNode], -AM[firstNode,firstModNode]))
                firstModuleDelta <- firstModuleDelta - AM[firstModNode, firstNode] - AM[firstNode,firstModNode]
            }
            # update the value gained from links between n2 and new module
            # skip any first module node that is not linked to second node
            if (AM[secondNode, firstModNode] != 0) {
                #print(c(-2, secondNode, firstModNode, AM[secondNode, firstModNode], AM[firstModNode, secondNode]))
                secondModuleDelta <- secondModuleDelta + AM[secondNode, firstModNode] + AM[firstModNode, secondNode]
            }
        }   
    }
    if (debug) {
        print(paste0("second group: ", modules[[secondModule]]))   
    }
    if (length(modules[[secondModule]]) > 0) {
        for (secondModNode in modules[[secondModule]]) {
            # find the value lost from links between n2 and its current module
            if (secondModNode != secondNode) {
                #print(c(-3, secondNode, secondModNode, -AM[secondModNode, secondNode], -AM[secondNode,secondModNode]))
                secondModuleDelta <- secondModuleDelta - AM[secondModNode, secondNode] - AM[secondNode,secondModNode]
            }
            # update for gained links between n1 and n2's module
            if (AM[firstNode, secondModNode] != 0) {
                #print(c(-4, firstNode, secondModNode,AM[firstNode, secondModNode], AM[secondModNode, firstNode]))
                firstModuleDelta <- firstModuleDelta + AM[firstNode, secondModNode] + AM[secondModNode, firstNode]
            }
        }
    }
    # calculate direction of clustering
    direction <- 0
    deltaQ <- 0 
    # favor answer if it is superior or equal
    if (firstModuleDelta >= secondModuleDelta & firstModuleDelta > 0)
    {
        deltaQ <- firstModuleDelta
        #print(c(firstModule, firstModuleDelta, secondModule, secondModuleDelta,1))
        direction <- 1
    }
    else if (secondModuleDelta > firstModuleDelta & secondModuleDelta > 0)
    {
        deltaQ <- secondModuleDelta
        direction <- -1
        #print(c(firstModule, firstModuleDelta, secondModule, secondModuleDelta,-1))
    }
    # need to access both values later
    return(c(direction,deltaQ))
}

extra <- FALSE
# actual iteration in loop 
combineModules <- function(extra) {
    
    # helps us check if we actually end up combining modules
    answer <- FALSE
    
    # move a node and test q value
    for (node in node_list$V1) {
        # check if node has outgoing edges
        if (node_list[node,3] & node_list[node,4]) {
            # identify best merging, default values indicate no changes
            #print(paste0("node: ", node))
            bestDeltaQ <- 0
            bestLink <- node
            change <- 0 
            # save current id in case of reverting
            nodeModID <- node_list[node, 2]
            
            # get all linked node_list to current node using adjacency matrix
            lN_list <- which(AM[node, ] != 0, arr.ind = TRUE)
    
            # go through all linked node_list  
            for (linkedNode in lN_list) {
                # node_list should be in different mod and inside q algorithm
                if (node_list[linkedNode, 2] != nodeModID & node_list[linkedNode, 3]) {
                    #print(paste0("linkedNode: ", linkedNode))
                    # find best value of proposed change
                    answer <- CalcShortQ(node, linkedNode)
                    direction <- answer[1]
                    deltaQ <- answer[2]
                    #print(paste0("deltaQ: ", answer[2]))
                    
                    # if the value is more advantageous 
                    if(deltaQ > bestDeltaQ) {
                        change <- direction
                        bestLink <- linkedNode
                        bestDeltaQ <- deltaQ
                        if (debug) {
                            print("more advantageous")
                            print(paste0("change: ", change))
                            print(paste0("bestDeltaQ: ", bestDeltaQ))
                        }
                    }
                }
            }
            
            # make best change in terms of modularity
            otherModID <- node_list[bestLink, 2]
            # current node goes to another module
            if(change == 1 & !(c(node) %in% modules[[otherModID]])) {
                # add node to new module 
                modules[[otherModID]][[length(modules[[otherModID]]) + 1]] <<- c(node)
                
                # change attribute of node
                node_list[node, 2] <- otherModID
             
                # remove node from current module 
                modules[[nodeModID]] <<- modules[[nodeModID]][! modules[[nodeModID]] %in% c(node)]
                # can't remove module from module list and adjacency Matrix if it is empty
                answer <- TRUE
            }
            else if(change == -1 & !(c(bestLink) %in% modules[[nodeModID]])) {
                # add node to new module 
                modules[[nodeModID]][[length(modules[[nodeModID]]) + 1]] <<- c(bestLink)
                
                # change attribute of node
                node_list[bestLink, 2] <- nodeModID
                
                # remove node from current module 
                modules[[otherModID]] <<- modules[[otherModID]][! modules[[otherModID]] %in% c(bestLink)]
                # don't remove module from module list and adjacency Matrix if it is empty 
                answer <- TRUE
            }
            if(debug) {
                print(modules)
                print(node_list)   
            }
            node_list <<- node_list
        }
    }
    
    if(extra) {
        print("still need to fill in")
    }
    
    return(answer)
}

# read in edges 
edges <- read.table(file.choose(), header = FALSE, sep = " ")
# make easily accessible in tibble 
edge_list <- tibble(from = edges[,1], to = edges[,2])

# read in node_list
node_list <- read.table(file.choose(), header = FALSE, sep = " ")
# make easily accessible in tibble 
#node_list <- data.frame(id = c(1,2,7,4,5,6,3))
node_list$moduleNumber <- c(1: nrow(node_list))
v <- rep(1, nrow(node_list))
node_list$Qstate <- as.logical(v)
node_list$isImportantCon<- as.logical(v)

# adjacency Matrix stores edges in identifiable format 
# decreases look up time for get directed link 
eg <- graph_from_data_frame(edge_list, directed = TRUE )
AM <- as_adjacency_matrix(eg,sparse = FALSE)

#modules represented by list
modules <- list(1:nrow(node_list))
for (i in modules) {
    modules[i] <- i
}

#debug option
debug = FALSE

tic("start")
mainAlgorithm()
toc()
