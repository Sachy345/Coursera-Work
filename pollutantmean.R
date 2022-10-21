pollutantmean <- function(directory, pollutant, id = 1:332){
  files <- list.files(directory, full.names = TRUE)
  data <- files[id]
  input <- lapply(data, read.csv)
  chem <- c()
    for (i in 1:length(input)) {
      d <- input[[i]]
      chem <- c(chem, d[,pollutant])
    }
  mean(chem, na.rm = TRUE)
}
