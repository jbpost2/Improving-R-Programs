## ----echo=FALSE,message=FALSE------------
options(dplyr.print_min = 5)
library(tidyverse)
library(knitr)


## ----eval=FALSE--------------------------
## nameOfFunction <- function(input1, input2, ...) {
##   #code
##   #return something with return()
##   #or returns last value
## }


## ----------------------------------------
var


## ----------------------------------------
colMeans


## ----------------------------------------
mean


## ----------------------------------------
mean.default


## ----eval=FALSE--------------------------
## nameOfFunction <- function(input1, input2, ...) {
##   #code
##   #return something with return()
##   #or returns last value
## }


## ----------------------------------------
standardize <- function(vector) {
	return((vector - mean(vector)) / sd(vector))
}


## ----------------------------------------
data <- runif(5)
data
result <- standardize(data)
result


## ----------------------------------------
mean(result)
sd(result)


## ----------------------------------------
standardize <- function(vector, center, scale) {
	if (center) {
		vector <- vector - mean(vector)
	}
	if (scale) {
		vector <- vector / sd(vector)
	}
	return(vector)
}


## ----------------------------------------
result <- standardize(data, center = TRUE, scale = TRUE)
result
result <- standardize(data, center = FALSE, scale = TRUE)
result


## ----------------------------------------
standardize <- function(vector, center = TRUE, scale = TRUE) {
	if (center) {
		vector <- vector - mean(vector)
	}
	if (scale) {
		vector <- vector / sd(vector)
	}
	return(vector)
}


## ----------------------------------------
result <- standardize(data, center = TRUE, scale = TRUE)
result
result <- standardize(data)
result


## ----------------------------------------
standardize <- function(vector, center = TRUE, scale = TRUE) {
	mean <- mean(vector)
	stdev <- sd(vector)
	if (center) {
		vector <- vector - mean
	}
	if (scale) {
		vector <- vector / stdev
	}
	return(list(vector, mean, stdev))
}


## ----------------------------------------
result <- standardize(data)
result  
result[[2]]


## ----------------------------------------
standardize <- function(vector, center = TRUE, scale = TRUE) {
	mean <- mean(vector)
	stdev <- sd(vector)
	if (center) {
		vector <- vector - mean
	}
	if (scale) {
		vector <- vector / stdev
	}
	return(list(result = vector, mean = mean, sd = stdev))
}


## ----------------------------------------
result <- standardize(data, center = TRUE, scale = TRUE)
result  
result$sd


## ----------------------------------------
mean
x <- c(rnorm(5), NA)
mean(x)


## ----------------------------------------
mean(x, na.rm = TRUE)


## ----------------------------------------
plot

## ---- eval = FALSE-----------------------
## plot(x = 1:5, y = (1:5)^2, type = "l", lty = "dashed")


## ----------------------------------------
plot(x = 1:5, y = (1:5)^2, type = "l", lty = "dashed")


## ----------------------------------------
plot.default


## ----------------------------------------
sd
mean.default


## ----------------------------------------
standardize <- function(vector, center = TRUE, scale = TRUE, ...) {
	mean <- mean(vector, ...)
	stdev <- sd(vector, ...)
	if (center) {
		vector <- vector - mean
	}
	if (scale) {
		vector <- vector / stdev
	}
	return(list(result = vector, mean = mean, sd = stdev))
}


## ----------------------------------------
sData <- standardize(airquality$Ozone, na.rm = TRUE)
sData$sd
sData$result


## ----------------------------------------
f <- function(x, ...){
	unnamed <- names(list(...))
	unnamedVals <- list(...)
	modifyX <- x^2  
	return(list(newX = modifyX, elipNames = unnamed, elipValues = unnamedVals))
}


## ----------------------------------------
f(x = 10, a = 1, b = "hey there", num = 1:3)


## ----eval=FALSE--------------------------
## nameOfFunction <- function(input1, input2, ...) {
##   #code
##   #return something with return()
##   #or returns last value
## }


## ----------------------------------------
cor


## ----------------------------------------
cor(iris$Sepal.Length, iris$Sepal.Width)


## ---- eval = FALSE-----------------------
## function (x, y = NULL, use = "everything", method = c("pearson",
##     "kendall", "spearman"))


## ----------------------------------------
cor(x = iris$Sepal.Length, method = "spearman", iris$Sepal.Width)


## ---- eval = FALSE-----------------------
## function (x, y = NULL, use = "everything", method = c("pearson",
##     "kendall", "spearman"))


## ----------------------------------------
cor(x = iris$Sepal.Length, met = "spearman", iris$Sepal.Width)


## ---- eval = FALSE-----------------------
## function (x, y = NULL, use = "everything", method = c("pearson",
##     "kendall", "spearman"))


## ----------------------------------------
transposeDF <- function(df) {
	if(!is.data.frame(df)){
		stop("I want a data frame only!")
	}
	t(df)
}
transposeDF(iris)


## ---- error = TRUE-----------------------
transposeDF <- function(df) {
	if(!is.data.frame(df)){
		stop("I want a data frame only!")
	}
	t(df)
}
transposeDF(as.matrix(iris))


## ----------------------------------------
center <- function(vec, type, ...) {
  if(!is.vector(vec)){
  	stop("Not a vector my friend.")
  }
	switch(type, 
				 mean = vec - mean(vec),
				 median = vec - median(vec),
				 trimmed = vec - mean(vec, ...),
				 stop("Mistake!")
	)
}
center(c(1,1,1,6,10), "mean")


## ----------------------------------------
center <- function(vec, type, ...) {
  if(!is.vector(vec)){
  	stop("Not a vector my friend.")
  }
	switch(type, 
				 mean = vec - mean(vec),
				 median = vec - median(vec),
				 trimmed = vec - mean(vec, ...),
				 stop("Mistake!")
	)
}
center(c(1,1,1,6,10), "median")


## ----------------------------------------
center <- function(vec, type, ...) {
  if(!is.vector(vec)){
  	stop("Not a vector my friend.")
  }
	switch(type, 
				 mean = vec - mean(vec),
				 median = vec - median(vec),
				 trimmed = vec - mean(vec, ...),
				 stop("Mistake!")
	)
}
center(c(1,1,1,6,10), "trimmed", trim = 0.2)


## ----------------------------------------
center <- function(vec, type, ...) {
	if(!is.vector(vec)){
		stop("Not a vector my friend.")
	}
	if(type == "mean"){
		vec - mean(vec)
	} else if (type =="median"){
		vec - median(vec)
	} else if (type =="trimmed") {
		vec - mean(vec, ...)
	} else {
		stop("Mistake!")
	}
}
center(c(1,1,1,6,10), "trimmed", trim = 0.2)


## ---- error = TRUE-----------------------
printNumObs <- function(df) {
	cat("The number of observations in the data set is ", nrow(df), "\n", sep = "")
}
iris %>% printNumObs %>% summarize(mean = mean(Sepal.Length))


## ----------------------------------------
printNumObs <- function(df) {
	cat("The number of observations in the data set is ", nrow(df), "\n", sep = "")
	invisible(df)
}
iris %>% printNumObs %>% summarize(mean = mean(Sepal.Length))


## ----------------------------------------
printNumObs <- function(df) {
	cat("The number of observations in the data set is ", nrow(df), "\n", sep = "")
	invisible(df)
}
temp <- printNumObs(iris)
str(temp)


## ----------------------------------------
mean(3:5) #prefix
3 + 5 #+ is infix
`+`(3, 5) #used as a prefix function


## ----------------------------------------
cars <- as.matrix(cars)
t(cars) %*% cars


## ----------------------------------------
`%*%`(t(cars), cars)


## ----------------------------------------
`%+%` <- function(a, b) paste0(a, b)
"new" %+% " string"


## ---- error = TRUE, eval = FALSE---------
## x <- y <- 2
## `<-`(x, `<-`(y, 2)) #interpretation of above code!
## 
## x <- y = 2# error! <- has higher precedence
## `=`(`<-`(x, y), 2) #interpretation of above code!
## 
## x = y <- 2 # this will work!
## `=`(x, `<-`(y, 2)) #interpretation of above code!


## ----------------------------------------
`%-%` <- function(a, b) {
	paste0("(", a, " %-% ", b, ")")
}
"a" %-% "b" %-% "c" #user defined infix are evaluated left to right!
`%-%`(`%-%`("a", "b"), "c")  #interpretation of above code!


## ---- out.width=800, echo = FALSE--------
knitr::include_graphics("../img/search-path.png")


## ---- out.width=800, echo = FALSE--------
search()


## ---- message = FALSE, warning = FALSE----
library(pryr) #install if needed
x <- "hey"
where("x")
where("mean")


## ----------------------------------------
f <- function(x){
	mean <- paste0(x, " is a value")
	mean
}
f(1:3)
mean


## ----------------------------------------
g <- function(x) {
  if (!exists("a", inherits = FALSE)) {
    message("Defining a")
    a <- 1
  } else {
    a <- a + 1
  }
  a
}


## ----------------------------------------
#Running the function doesn't create 
#the a object in our global environment!
g(10)
g(10)


## ----------------------------------------
y <- 10
f <- function(x){
	y <- 1
	x + y
}
f(15)


## ----------------------------------------
y <- 1
f <- function(x){
	x + y
}
f(10)

