#####################################################
##Just the R code in lectures from course:
##Programming in R
##Justin Post 2018
#####################################################

#####################################################
##Part I
#####################################################

#####################################################
##Review of Concepts

x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
data.frame(char = x, data1 = y, data2 = z)

iris
str(iris)
attributes(iris)
iris[1:4, 2:4]
iris[1, ]
iris[ , c("Sepal.Length", "Species")]
iris$Sepal.Length

#dplyr and the tidyverse
install.packages("tidyverse")
library(tidyverse)

#install.packages("fivethirtyeight")
library(fivethirtyeight)
head(fandango, n = 4) #look at just first 4 observations
fandango <- tbl_df(fandango)
fandango

#substet observations
filter(fandango, year == 2014)
filter(fandango, (year == 2014) & (rottentomatoes <= 60))

#reorder by film title
arrange(fandango, film)

#get secondary arrangement as well
arrange(fandango, year, film)

#descending instead
arrange(fandango, year, desc(film))

#compare two types of code
arrange(filter(fandango, year == 2014), desc(film))

fandango %>% filter(year == 2014) %>% arrange(desc(film))

#silly example
fandango$imdb %>% quantile()
fandango$imdb %>% quantile() %>% range()

#Choose a column by name
fandango %>% select(film, fandango_stars)

#all columns between
fandango %>% select(film, year:rottentomatoes_user)

#all columns containing
fandango %>% select(film, contains("fandango"))

#all columns starting with
fandango %>% select(film, starts_with("imdb"))
#all columns ending with
fandango %>% select(film, ends_with("user"))

##Create an average rotten tomatoes score variable
fandango %>% mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2)
fandango %>% mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2) %>% select(avgRotten)

#transmute will keep the new variable only
fandango %>% transmute(avgRotten = (rottentomatoes + rottentomatoes_user)/2)

#summarize a variable, by a group as well
fandango %>% summarise(avgStars = mean(fandango_stars))
fandango %>% group_by(year) %>% summarise(avgStars = mean(fandango_stars))

# create two simple data frames
a <- data_frame(color = c("green", "yellow", "red"), num = 1:3)
b <- data_frame(color = c("green", "yellow", "pink"), size = c("S", "M", "L"))
a
b
inner_join(a, b)
full_join(a, b)
left_join(a, b)
right_join(a, b)
left_join(b, a)
semi_join(a, b)
anti_join(a, b)

b <- b %>% rename(col = color)
a
b
inner_join(a, b, by = c("color" = "col"))

#tidyr
tempsData <- read_delim(file = "https://raw.githubusercontent.com/jbpost2/Programming-in-R/master/datasets/cityTemps.txt", delim = " ")
tempsData

gather(tempsData, key = day, value = temp, 2:8)

newTempsData<-gather(tempsData, key = day, value = temp, sun,
                     mon, tue, wed, thr, fri, sat)
newTempsData

spread(newTempsData, key = day, value = temp)


#####################################################
##For Loops

for (i in 1:10){
  print(i)
}

for (value in c("cat","hat","worm")){
  print(value)
}

set.seed(10)
data<-round(runif(5),2)
data

words<-c("first", "second", "third", "fourth", "fifth")
paste0("The ", words[1], " data point is ", data[1], ".")

for (i in 1:5){
  print(paste0("The ", words[i], " data point is ",
data[i], "."))
}

#install.packages("Lahman")
library(Lahman)
Batting2010 <- Batting %>% filter(yearID == 2010) %>% 
select(playerID, teamID, G, AB, R, H, X2B, X3B, HR)
summary(Batting2010[ , 3])

stats <- matrix(nrow = 6, ncol = 7)
for (i in 1:(dim(Batting2010)[2] - 2)){
stats[ , i]<-summary(Batting2010[ , i + 2])
}
stats

colnames(stats) <- names(Batting2010)[3:9]
stats


#####################################################
##Vectorized Functions

colMeans(select(Batting, G:GIDP), na.rm = TRUE)

install.packages("microbenchmarK")
library(microbenchmark)

Bat <- select(Batting, G:GIDP)
microbenchmark(
  colMeans(Bat, na.rm = TRUE)
)
microbenchmark(
  for(i in 1:17){
    mean(Bat[ , i], na.rm = TRUE)
  }
)

library(matrixStats) #install if not installed

Batting %>% group_by(playerID) %>%
  summarise(totG = sum(G), totAB = sum(AB)) %>% 
  select(-playerID) %>% as.matrix() %>%
  colMedians(na.rm = TRUE)

airquality<-tbl_df(airquality)
airquality

#initialize vector to save results
status<-vector()

for (i in 1:(dim(airquality)[1])){
  if(airquality$Wind[i] >= 15){
    status[i] <- "HighWind"
  } else if (airquality$Wind[i] >= 10){
    status[i] <- "Windy"
  } else if (airquality$Wind[i] >= 6){
    status[i] <- "LightWind"
  } else if (airquality$Wind[i] >= 0){
    status[i] <- "Calm"
  } else {
    status[i] <- "Error"
  }
}

status

airquality$status <- status
airquality %>% group_by(status) %>%
  mutate(avgTemp = mean(Temp))


ifelse(airquality$Wind >= 15, "HighWind",
       ifelse(airquality$Wind >= 10, "Windy",
              ifelse(airquality$Wind >= 6, "LightWind", "Calm")))

loopTime<-microbenchmark(
  for (i in 1:(dim(airquality)[1])){
    if(airquality$Wind[i] >= 15){
      status[i] <- "HighWind"
    } else if (airquality$Wind[i] >= 10){
      status[i] <- "Windy"
    } else if (airquality$Wind[i] >= 6){
      status[i] <- "LightWind"
    } else if (airquality$Wind[i] >= 0){
      status[i] <- "Calm"
    } else{
      status[i] <- "Error"
    }
  }
  , unit = "us")

vectorTime <- microbenchmark(
  ifelse(airquality$Wind >= 15, "HighWind",
         ifelse(airquality$Wind >= 10, "Windy",
                ifelse(airquality$Wind >= 6, "LightWind", "Calm")))
  , unit = "us")

loopTime
vectorTime


apply(X = select(airquality, Ozone:Temp), MARGIN = 2, 
      FUN = summary, na.rm = TRUE)

fit <- lm(Ozone ~ Wind, data = airquality)
fit <- list(fit$residuals, fit$effects, fit$fitted.values)
fit[[1]]
fit[[2]]
lapply(X = fit, FUN = mean)
sapply(X = fit, FUN = mean)

air2 <- select(airquality, Ozone:Day)
microbenchmark(apply(X = air2, MARGIN = 2, FUN = mean, na.rm = TRUE))
microbenchmark(colMeans(air2, na.rm = TRUE))


#####################################################
##Writing Functions

var
colMeans
mean
base:::mean.default

standardize <- function(vector) {
  return((vector - mean(vector)) / sd(vector))
}

data <- runif(5)
data
result <- standardize(data)
result

mean(result)
sd(result)

standardize <- function(vector, center, scale) {
  if (center == TRUE) {
    vector <- vector - mean(vector)
  }
  if (scale == TRUE) {
    vector <- vector / sd(vector)
  } 
  return(vector)
}

result <- standardize(data, center = TRUE, scale = TRUE)
result
result <- standardize(data, center = FALSE, scale = TRUE)
result

standardize <- function(vector, center = TRUE, scale = TRUE) {
#center and scale if appropriate
  if (center == TRUE) {
    vector <- vector - mean(vector)
  }
  if (scale == TRUE) {
    vector <- vector / sd(vector)
  } 
  return(vector)
}

result <- standardize(data, center = TRUE, scale = TRUE)
result
#same call
result <- standardize(data)
result

standardize <- function(vector, center = TRUE, scale = TRUE) {
  #get attributes to return
  mean <- mean(vector)
  stdev <- sd(vector)
  #center and scale if appropriate
  if (center == TRUE) {
    vector <- vector - mean
  }
  if (scale == TRUE) {
    vector <- vector / stdev
  } 
  #return a list of objects
  return(list(vector, mean, stdev))
}

result <- standardize(data)
result
result[[2]]

standardize <- function(vector, center = TRUE, scale = TRUE) {
  #get attributes to return
  mean <- mean(vector)
  stdev <- sd(vector)
  #center and scale if appropriate
  if (center == TRUE) {
    vector <- vector - mean
  }
  if (scale == TRUE) {
    vector <- vector / stdev
  } 
  #return a list of objects
  return(list(result = vector, mean = mean, sd = stdev))
}

result <- standardize(data, center = TRUE, scale = TRUE)
result
result$sd

apply
apply(X = select(airquality, Ozone:Temp), MARGIN = 2, 
FUN = summary, na.rm = TRUE)

standardize <- function(vector, center = TRUE, scale = TRUE, ...) {
  #get attributes to return
  mean <- mean(vector, ...)
  stdev <- sd(vector, ...)
  #center and scale if appropriate
  if (center == TRUE) {
    vector <- vector - mean
  }
  if (scale == TRUE) {
    vector <- vector / stdev
  } 
  #return a list of objects
  return(list(result = vector, mean = mean, sd = stdev))
}

sData <- standardize(airquality$Ozone, na.rm = TRUE)
sData$mean
sData$sd
sData$result


#####################################################
## Parallel Computing

iris<-tbl_df(iris)
iris

library(fpc)       #install if needed
iris$Species <- NULL #remove category labels (truely 3 groups)
clus<-kmeans(iris, centers = 3, nstart = 100)
plotcluster(iris, clus$cluster)


parallel.function <- function(data, i) {
kmeans(as.matrix(data), centers = 3, nstart = i)
results <- lapply(X = c(25, 25), FUN = parallel.function, data = iris)
results[[1]]
results[[2]]

temp.vector <- sapply(results, function(result) {result$tot.withinss})
#take the result for the best one as the final solution
result <- results[[which.min(temp.vector)]]
print(result)


library(parallel)
cores <- detectCores()
cluster <- makeCluster(cores - 1)
results <- parLapply(cluster, X = c(2500, 2500, 2500),
fun = parallel.function, data = iris)
temp.vector <- sapply(results, function(result) {result$tot.withinss})
result <- results[[which.min(temp.vector)]]
print(result)

#compare computing time
parTime <- microbenchmark({
  library(parallel)
  cores <- detectCores()
  cluster <- makeCluster(cores - 1)
  results <- parLapply(cluster, X = c(25000, 25000, 25000),
  fun = parallel.function, data = iris)
  temp.vector <- sapply(results, function(result) {result$tot.withinss})
  result <- results[[which.min(temp.vector)]]
}, times = 10, unit = "s")

straightTime <- microbenchmark({
  clus <- kmeans(iris, centers = 3, nstart = 75000)
}, times = 10, unit = "s")

parTime
straightTime
