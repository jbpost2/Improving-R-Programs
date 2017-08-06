###########################################################
##Code corresponding to activities in course:
##Programming in R
##_Your_Name_Here_
##August 9, 2017
###########################################################

###########################################################
##Manipulating Data 
###########################################################

#We'll use the Lahman package data sets. These data sets give stats and information about MLB players through the years. If the package is not installed please install it and load it in. Write R code to do the following:  

#1. Convert the Pitching data set to a tibble.

#2. Select just the playerID,yearID, teamID W, L, and ERA columns.

#3. Contunuing with the previous question's data set, obtain only rows from 2010.

#4. Continuing, now create a new column that is the Win loss percentage. i.e. Wins/(Wins+Losses)

#5. Continuing, now sort your data set by teamID in descending order.

#6. Continuing, se the summarise and group_by commands to find the total number of wins for each team.


###########################################################
##For loops
###########################################################

#Run the code below to create a data frame with random values from a few commonly used distributions. 
set.seed(100)
df <- data.frame(gamma = rgamma(n = 20, shape = 4, scale = 2), uniform = runif(n = 20), normal = rnorm(n = 20))

#Write R code to do the following:

#1. Create a for loop that will cycle through the columns and save the standard deviation of each column in a vector called 'sds'.

#2. Create a for loop that will cycle through the columns and use if-then logic to transform and overwrite the data. For the gamma column do a ln (log in R) transform of the data. For the uniform column do a -ln transform of the data. For the normal column do a standardization by subtracting off the mean of the normal column and dividing by its standard deviation.


###########################################################
##Vectorized Functions
###########################################################

#We'll use the built-in 'CO2' data set. Write R code to do the following:

#1. Suppose we want to create a "group" indicator variable that tells us which Type*Treatment group we are in (i.e Quebec-nonchilled, Quebec-chilled, Mississippi-nonchilled, Mississippi-chilled, group 1, 2, 3, 4, respectively). Use ifelse to create this new variable and add it to the data set.

#2. Report the means of each numeric column.

#3. Report the standard deviations of each column (use the matrixStats package).


###########################################################
##Function Writing 
###########################################################

#Write R code to do the following:

#1. Write your own absolute value function called myAbsoluteValue. There are two options for the input
    #If x is positive or zero, return x.
    #If x is negative, return -x.
#Check your function works by plugging in a few values.

#2. Challenge: Create your own summary function called mySummary that takes in a single vector and is capable of outputting the min, max, median, mean, sd, and var of the vector. By default have the function produce the min, median, and max only, but allow the user to determine which of the statistics is returned. Return the appropriate object with names for each item returned.

#Note: Allow for the passing of unnamed arguments.

#Evaluate your function on the following vector and return only the min, mean, and variance. (Recall the na.rm=TRUE argument for many of the basic summary functions.
x <- c(runif(10), NA)
