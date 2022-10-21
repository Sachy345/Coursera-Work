corr <- function(directory, threshold = 0){
  files <- list.files(directory, full.names = TRUE)
  input <- lapply(files, read.csv)
  data_complete <- complete(directory)
  data_thresh <- data_complete["nobs"] > threshold
  data_complete <- data_complete[data_thresh, ]
  if (dim(data_complete)[1] == 0){
    result <- numeric(0)
  }
  else{
  data_true <- lapply(files[data_complete$id], read.csv)
  data_clean <- c()
  result <- c()
  for (i in 1:length(data_true)){
    data_clean <- na.omit(data_true[[i]])
    vec_cor <- cor(data_clean$sulfate, data_clean$nitrate)
    result <- c(result, vec_cor)
  }
  }
  result
}
