complete <- function(directory, id = 1:332){
  files <- list.files(directory, full.names = TRUE)
  data <- files[id]
  input <- lapply(data, read.csv)
  nobs <- c()
  for (i in 1:length(input)){
    d <- na.omit(input[[i]])
    nobs <- c(nobs, nrow(d))
  }
  data.frame(id = id, nobs = nobs)
}
