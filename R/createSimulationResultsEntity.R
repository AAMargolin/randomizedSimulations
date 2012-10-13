library(synapseClient)
simulationsDataFrameEntity <- loadEntity("syn1421237")
simulationsDataFrame <- simulationsDataFrameEntity$objects$simulationsData

parentId <- "syn1426966"

for (rowCtr in 1:nrow(simulationsDataFrame)){
  if(rowCtr %% 100 == 1){
    print(paste("processing", rowCtr))
  }
  entityName <- paste("simulation", rowCtr, sep="_")
  newEntity <- Data(name=entityName, parentId=parentId)
  for (colCtr in 1:ncol(simulationsDataFrame)){
    curColName <- colnames(simulationsDataFrame)[colCtr]
    newEntity$annotations[[curColName]] <- simulationsDataFrame[rowCtr,colCtr]
  }
  newEntity <- storeEntity(newEntity)
}
