## ----echo=FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(knitr)
options(dplyr.print_min = 5)


## ----vectorVis, echo = FALSE, fig.align='center', out.width = '650px', echo = FALSE----
knitr::include_graphics("../img/vectorVisualF.png")


## ----indexVec2---------------------------
letters
letters[1:4]
x <- c(1, 2, 5); letters[x]


## ---- echo = FALSE, fig.align='center', out.width = '500px', echo = FALSE----
knitr::include_graphics("../img/dfVisualF.png")


## ----------------------------------------
myIris <- as_tibble(iris)
str(myIris)


## ----------------------------------------
myIris[1:4, 2:4]
myIris[1, ]


## ---- eval =FALSE------------------------
## myIris$Sepal.Length


## ----------------------------------------
dplyr::pull(myIris, Sepal.Length)


## ----------------------------------------
dplyr::select(myIris, starts_with("Sepal"))


## ----eval=FALSE--------------------------
## install.packages("tidyverse")


## ---- eval = FALSE-----------------------
## library(tidyverse)


## ----------------------------------------
library(Lahman) #Install pacakage if needed
Batting %>% 
  as_tibble() %>% 
  select(starts_with("X"), ends_with("ID"), G) %>% 
  rename("Doubles" = X2B, "Triples" = X3B)


## ---- message = FALSE--------------------
wineData <- read_csv("../datasets/winequality-full.csv")
wineData


## ----------------------------------------
summary(wineData)


## ----------------------------------------
#fixed acidity
c(Mean = mean(wineData$`fixed acidity`), 
  Median = median(wineData$`fixed acidity`), 
  TrimmedMean = mean(wineData$`fixed acidity`, 0.05))
#volatile acidity
c(Mean = mean(wineData$`volatile acidity`), 
  Median = median(wineData$`volatile acidity`), 
  TrimmedMean = mean(wineData$`volatile acidity`, 0.05))
#...


## ----eval=FALSE--------------------------
## for(index in values){
##   code to be run
## }


## ----------------------------------------
for (index in 1:10){
  print(index)
}


## ----------------------------------------
for (i in c("cat", "dog", "wolf")){
  print(i)
}


## ----------------------------------------
values <- 1:10
for (index in values){
  print(index)
}


## ----------------------------------------
for (i in seq_along(iris)){
  print(names(iris)[i])
}


## ----------------------------------------
for(i in 1:12){ #first 12 columns are numeric
  colData <- pull(wineData, i)
  print(names(wineData)[i])
  print(c(Mean = mean(colData),
          Median = median(colData),
          TrimmedMean = mean(colData, 0.05))
  )
}


## ----------------------------------------
ncols <- ncol(wineData)
sumDF <- data.frame(varName = names(wineData)[-ncols], 
                    mean = numeric(ncols-1), 
                    median = numeric(ncols-1), 
                    trimmedMean = numeric(ncols-1)
                    )
sumDF


## ----------------------------------------
for(i in seq_along(wineData)[-ncols]){
  colData <- pull(wineData, i)
  sumDF[i, 2:4] <- c(mean(colData), median(colData), mean(colData, 0.05))
}
sumDF


## ---- eval = FALSE-----------------------
## while(condition) {
## 	expression to evaluate
##   modify condition to FALSE?
## }


## ----------------------------------------
for (i in 1:5){
	if (i == 4){ 
	  break 
	  }
  print(i)
}


## ----------------------------------------
for (i in 1:5){
	if (i == 3){
	  next
	} 
  print(i)
}


## ----------------------------------------
wineData %>% 
  select(-type) %>% 
  colMeans()


## ----eval=FALSE--------------------------
## install.packages("microbenchmarK")

## ----------------------------------------
library(microbenchmark)


## ----------------------------------------
wineData2 <- wineData %>% select(-type)
microbenchmark(colMeans(wineData2), unit = "ms")
microbenchmark(for(i in 1:12){mean(wineData[[i]])}, unit = "ms")


## ---- message = FALSE--------------------
library(matrixStats)
wineData %>% 
  select(-type) %>%
  as.matrix() %>%
  colMedians()


## ----------------------------------------
#initialize vector to save results
qualityCat <- character()

for (i in 1:(dim(wineData)[1])){
  if(wineData$quality[i] <= 3){
    qualityCat[i] <- "Poor"
  } else if(wineData$quality[i] <= 5){
    qualityCat[i] <- "Ok"
  } else if(wineData$quality[i] <= 7){
    qualityCat[i] <- "Good"
  } else if(wineData$quality[i] <= 10){
    qualityCat[i] <- "Great"
  } else {
    qualityCat[i] <- "Error"
  }
}


## ----------------------------------------
wineData$qualityCat <- qualityCat
wineData %>% select(qualityCat, quality, everything())


## ----eval=FALSE--------------------------
## if_else(vector_condition, if_true_do_this, if_false_do_this)


## ----eval=FALSE--------------------------
## if_else(vector_condition, if_true_do_this, if_false_do_this)


## ----------------------------------------
qualityCat <- if_else(wineData$quality <= 3, "Poor",
                  if_else(wineData$quality <= 5, "Ok",
                        if_else(wineData$quality <= 7, "Good",
                            if_else(wineData$quality <= 10, "Great", "Error"))))


## ----------------------------------------
loopTime<-microbenchmark(
  for (i in 1:(dim(wineData)[1])){
    if(wineData$quality[i] <= 3){
      qualityCat[i] <- "Poor"
    } else if(wineData$quality[i] <= 5){
      qualityCat[i] <- "Ok"
    } else if(wineData$quality[i] <= 7){
      qualityCat[i] <- "Good"
    } else if(wineData$quality[i] <= 10){
      qualityCat[i] <- "Great"
    } else {
      qualityCat[i] <- "Error"
    }
  }
, unit = "us")


## ----------------------------------------
vectorTime <- microbenchmark(
    if_else(wineData$quality <= 3, "Poor",
        if_else(wineData$quality <= 5, "Ok",
            if_else(wineData$quality <= 7, "Good",
                if_else(wineData$quality <= 10, "Great", "Error"))))
, unit = "us")


## ----------------------------------------
loopTime
vectorTime


## ----------------------------------------
wineData %>% 
  group_by(qualityCat, type) %>% 
  summarize(meanAlcohol = mean(alcohol))


## ----------------------------------------
wineData %>% 
  group_by(qualityCat, type) %>%
  mutate(meanAlcoholCat = mean(alcohol)) %>%
  select(meanAlcoholCat, qualityCat, type, alcohol, everything())


## ----------------------------------------
apply(X = wineData %>% select(-type, -qualityCat),
      MARGIN = 2, 
      FUN = summary, 
      na.rm = TRUE)


## ----------------------------------------
myList <- list(
  norm = rnorm(100),
  unif = runif(25),
  gamma = rgamma(500, rate = 1, shape = 1)
)


## ----------------------------------------
lapply(X = myList, FUN = mean)


## ----------------------------------------
sapply(X = myList, FUN = mean)


## ----------------------------------------
sample(size = 5, letters, replace = TRUE)
sample(size = 5, letters, replace = TRUE)


## ----------------------------------------
set.seed(1)
sample(size = 5, letters, replace = TRUE) %>% 
  unique()
set.seed(1)
sample(size = 5, letters, replace = TRUE) %>% 
  unique() %>% 
  length()


## ----------------------------------------
set.seed(1)
sample(size = 5, letters, replace = TRUE) %>% 
  unique() %>% 
  length() == 5


## ----------------------------------------
replicate(5, 
  sample(size = 5, letters, replace = TRUE) %>% 
    unique() %>% 
    length() == 5
)


## ----------------------------------------
replicate(50000, 
  sample(size = 5, letters, replace = TRUE) %>% 
    unique() %>% 
    length() == 5
) %>% 
  mean()

