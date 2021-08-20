library(Matrix)
library("dplyr")
library("rlist")
library(igraph)
library(matrixcalc)
library(tictoc)


# create coarsening matrix
create_mat <- function(list){
  m1 <- matrix(1, nrow = sum(lengths(list)), ncol = length(list))
  m2 <- matrix(seq(nrow(m1)), ncol = ncol(m1), nrow = nrow(m1))
  l2 <- lapply(lengths(list), seq)
  v2 <- c(0, head(cumsum(lengths(list)), -1))
  l2 <- Map(`+`, l2, v2)
  m1[!mapply(`%in%`, as.data.frame(m2), l2)] <- 0
  return(t(m1))
}

# equivalent to main algorithm 
cluster <- function(adjacencyMatrix, degreeVector, totalRowSum) {
  
  # if the adjacency matrix has 1 element the modularity is 1
  if (nrow(adjacencyMatrix) == 1 & ncol(adjacencyMatrix) == 1) {
    print("done")
    return(1)
  }
  
  # store sparse entries (coordinate pair)
  sparseEntries <- which(adjacencyMatrix!=0, arr.ind = TRUE)
  sparseEntries <- sparseEntries[order(sparseEntries[,1], decreasing= FALSE),]

  
  sparseEntries <- sparseEntries[apply(sparseEntries, MARGIN =  1, FUN = function(x) !any(duplicated(x))), ]
  
  modularityMatrix <- (2*adjacencyMatrix)/totalRowSum - (2*degreeVector %*% t(degreeVector))/(totalRowSum * totalRowSum)
  
  
  # initialize variables
  positiveFlag <- FALSE
  length <- nrow(adjacencyMatrix)
  pVector <- vector("integer", length)
  counter <- 1
  indexofLargestVal <- 0
  largestVal <- 0
  
  # fill pVec and check for positives
  for (j in 1:nrow(sparseEntries)) {
    if (sparseEntries[j,1] == counter)
      
    {
      value <- modularityMatrix[counter, sparseEntries[j,2]]
      if (value > 0) {
        positiveFlag <- TRUE
        if (value > largestVal) {
          indexofLargestVal <- sparseEntries[j,2]
          largestVal <- value
        }
      }
      if (counter == length & j == nrow(sparseEntries)) {
        pVector[counter] <- indexofLargestVal
      }
    }
    else {
      pVector[counter] <- indexofLargestVal
      counter <- counter + 1
      largestVal <- 0
      value <- modularityMatrix[counter, sparseEntries[j,2]]
      if (value > 0) {
        positiveFlag <- TRUE
        if (value > largestVal) {
          indexofLargestVal <- sparseEntries[j,2]
          largestVal <- value
        }
      }
      if (counter == length & j == nrow(sparseEntries)) {
        pVector[counter] <- indexofLargestVal
      }
    }
    
  }
  
  #exit condition
  if(positiveFlag == FALSE) {
    print("done")
    tr <- matrix.trace(as.matrix(modularityMatrix))
    return(tr/2)
  }
 
  #initialize Aggregates
  Ag <- vector(mode = "list")
  
  # find aggregates
  indexList <- c(1:length)
  runNum <- 0
  while (length(indexList) != 0) {
    firstValue <- indexList[1]
    if(pVector[firstValue] != -1 & length(indexList) != 1){
      newIndex <- pVector[firstValue]
      if (pVector[newIndex] == firstValue) {
        indexList <- indexList[! indexList %in% c(newIndex, firstValue)]
        cluster <- list(firstValue,newIndex) 
        Ag[[length(Ag) + 1]] <- cluster
        for (el in mods[[newIndex-runNum]]) {
          #mods[[firstValue - runNum]] <<- append(mods[[firstValue - runNum]], list(el))
          mods[[firstValue - runNum]][[length(mods[[firstValue - runNum]]) + 1]] <<- c(el)
        }
        mods <<- mods[-(newIndex - runNum)]
        runNum <- runNum + 1
      }
      else {
        indexList <- indexList[! indexList %in% c(firstValue)]
        Ag[[length(Ag) + 1]] <- firstValue
      }
    }
    else {
      indexList <- indexList[! indexList %in% c(firstValue)]
      Ag[[length(Ag) + 1]] <- firstValue
    }
  }

  # print to text file
  sink("partitions.txt", append = TRUE)
  print("--------------------------------------")
  print(mods)
  sink()

  
  # create coarsening matrix
  rCoarse = create_mat(Ag)
  
  # triple matrix product
  Anew = rCoarse %*% adjacencyMatrix %*% t(rCoarse)
  finalMat <<- Anew
  
  #new degree vector
  rC = rCoarse %*% degreeVector 
  
  #repeat clustering
  cluster(Anew, rC, sum(rC))
}


# load edges.txt
edgeTable <- read.table(file.choose(), header = FALSE, sep = " ")
edg <- graph_from_data_frame(edgeTable, directed = TRUE )

#setup adjacencyMatrix
adjacencyMatrix <- as_adjacency_matrix(edg,sparse = FALSE)
adjacencyMatrix <- as(adjacencyMatrix, "dgTMatrix")

# get degree vector, tabulate counts frequency of element in vector
degreeVector <- tabulate(adjacencyMatrix@i + 1)
totalRowSum <- sum(degreeVector)

# apples to apples comparison so we can crosscheck algorithms (modularity is caluclated a different way)
QalgoMod <- TRUE

# final adjacency matrix
finalMat <- matrix(1, nrow = 1, ncol = 1)

# setup modules 
mods <- list(1:nrow(adjacencyMatrix))
for (i in mods) {
  mods[i] <- i
}
    
#way to store last partition 
lastMod <- vector(mode = "list")
#run clustering
tic("start")
cluster(adjacencyMatrix, degreeVector, totalRowSum)
toc()

if(QalgoMod) {
  trace <- matrix.trace(as.matrix(finalMat))
  allEdges <- sum(finalMat)
  print(paste0("qalgoMod: ", trace/allEdges))
  print("edges: ")
  print(diag(finalMat))
}

#delete file to start over
#file.remove("C:/Users/artsy/OneDrive/Documents/partitions.txt") 
#file.remove("C:/Users/artsy/OneDrive/Documents/finalPartition.txt") 
