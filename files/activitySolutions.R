###########################################################
##Code corresponding to activities in course:
##Programming in R
##_Your_Name_Here_
##2018
###########################################################

###########################################################
##Manipulating Data 
###########################################################

#We'll use the Lahman package data sets. These data sets give stats and information about MLB players through the years. If the package is not installed please install it and load it in. Write R code to do the following:  

#1. Convert the Pitching data set to a tibble.
library(Lahman)
myPitching <- tbl_df(Pitching)

#2. Select just the playerID,yearID, teamID W, L, and ERA columns.
pitchingSubset <- myPitching %>% select(playerID, yearID, teamID, W, L, ERA)

#3. Contunuing with the previous question's data set, obtain only rows from 2010.
pitchSub2010 <- pitchingSubset %>% filter(yearID == 2010)

#4. Continuing, now create a new column that is the Win loss percentage. i.e. Wins/(Wins+Losses)
pitchSub2010 <- mutate(pitchSub2010, WLP = W / (W + L))

#5. Continuing, now sort your data set by teamID in descending order.
pitchSub2010 %>% arrange(desc(teamID))

#6. Continuing, se the summarise and group_by commands to find the total number of wins for each team.
pitchSub2010 %>% group_by(teamID) %>% summarize(TotalWins = sum(W))


###########################################################
##For loops
###########################################################

#Run the code below to create a data frame with random values from a few commonly used distributions. 
set.seed(100)
df <- data.frame(gamma = rgamma(n = 20, shape = 4, scale = 2), uniform = runif(n = 20), normal = rnorm(n = 20))

#Write R code to do the following:

#1. Create a for loop that will cycle through the columns and save the standard deviation of each column in a vector called 'sds'.
sds <- vector(mode = "numeric", length = 3)
for (i in 1:length(sds)) { 
	sds[i] <- sd(df[ , i]) 
}

#2.  Run the following code to create a 4x3 matrix of random integers from 5 to 50.
set.seed(100)
Obs <- matrix(sample(5:50, 12, replace = TRUE), nrow = 4, ncol = 3)
Exp <- matrix( , nrow = dim(Obs)[1], ncol = dim(Obs)[2])

#Now that the matrix Exp has been initialized with the same dimenstions as the Obs matrix, use loops to update the values as follows:
#Each cell should contain the row total * column total / overall total.
#For example, the first cell should contain 75*72/309 = 17.47573 (Hint: You'll need to nest one for loop inside another one!)
for (i in 1:dim(Obs)[2]) {
	for (j in 1:dim(Obs)[1]) {
		Exp[j, i] = sum(Obs[ , i]) * sum(Obs[j, ]) / sum(Obs)
	}
}


###########################################################
##Vectorized Functions
###########################################################

#We'll use the built-in 'CO2' data set. Write R code to do the following:

#1. Suppose we want to create a "group" indicator variable that tells us which Type*Treatment group we are in (i.e Quebec-nonchilled, Quebec-chilled, Mississippi-nonchilled, Mississippi-chilled, group 1, 2, 3, 4, respectively). Use ifelse to create this new variable and add it to the data set.
myCO2 <- tbl_df(CO2) %>% 
	mutate(group = ifelse((Type == "Quebec") & (Treatment == "nonchilled"), 
												1, ifelse((Type == "Quebec") & (Treatment == "chilled"), 2,
																	ifelse((Type == "Mississippi") & (Treatment == "nonchilled"), 3,
																				 ifelse((Type == "Mississippi") & (Treatment == "chilled"), 4, 0)))))

#2. Report the means of each numeric column.
colMeans(select(myCO2, conc:group), na.rm = TRUE)

#3. Report the standard deviations of each column (use the matrixStats package).
library(matrixStats)
colSds(as.matrix(select(myCO2, conc:group)))
# alternatively:	apply(select(myCO2, conc:group), MARGIN = 2, FUN=sd)


###########################################################
##Function Writing 
###########################################################

#Write R code to do the following:

#1. Write your own absolute value function called myAbsoluteValue. There are two options for the input
    #If x is positive or zero, return x.
    #If x is negative, return -x.
#Check your function works by plugging in a few values.
myAbsoluteValue <- function(vector) {
	return(ifelse(vector >= 0, vector, -vector))
}
myAbsoluteValue(c(-10,-5,0,5,10))

#2. Challenge: Create your own summary function called mySummary that takes in a single vector and is capable of outputting the min, max, median, mean, sd, and var of the vector. By default have the function produce the min, median, and max only, but allow the user to determine which of the statistics is returned. Return the appropriate object with names for each item returned.

#Note: Allow for the passing of unnamed arguments.
mySummary <- function(vector, min = TRUE, max = TRUE, med = TRUE, mean = FALSE, sd = FALSE, var = FALSE, ...) {

	Results <- list()
	
	if (min == TRUE) {
		Results$Minimum <- min(vector, ...)
	}
	if (max == TRUE) {
		Results$Maximum <- max(vector, ...)
	} 
	if (med == TRUE) { 
		Results$Median <- median(vector, ...)
		}
	if (mean == TRUE) {
		Results$Mean <- mean(vector, ...)
		}
	if (sd == TRUE) { 
		Results$SD <- sd(vector, ...)
		}
	if (var == TRUE) {
		Results$Variance <- var(vector, ...)
		}
	return(Results)
}

#Evaluate your function on the following vector and return only the min, mean, and variance. (Recall the na.rm=TRUE argument for many of the basic summary functions.
x <- c(runif(10), NA)
mySummary(x, max = FALSE, med = FALSE, mean = TRUE, var = TRUE, na.rm = TRUE)
