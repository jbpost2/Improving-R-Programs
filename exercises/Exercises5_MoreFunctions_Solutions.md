Exercises 5 - More Functions Solutions
================

1.  Create your own summary function called `mySummary` that takes in a
    single vector and is capable of outputting the `min`, `max`,
    `median`, `mean`, and `sd` of the vector.

By default have the function produce the `min`, `median`, and `max`
only. Return the appropriate object with names for each item returned.
Allow for the passing of unnamed arguments.

Hint: Create an empty `list` using `myList <- list()`. If the user
specifies they want an input (or by default it is `TRUE`), add an
element to that list (`myList$max <-` for instance).

``` r
mySummary <- function(vector, min = TRUE, max = TRUE, med = TRUE, mean = FALSE, sd = FALSE, ...) {

    myList <- list()
    
    if (min == TRUE) {
        myList$Minimum <- min(vector, ...)
    }
    if (max == TRUE) {
        myList$Maximum <- max(vector, ...)
    } 
    if (med == TRUE) { 
        myList$Median <- median(vector, ...)
        }
    if (mean == TRUE) {
        myList$Mean <- mean(vector, ...)
        }
    if (sd == TRUE) { 
        myList$SD <- sd(vector, ...)
        }
    return(myList)
}
```

2.  Evaluate your function on the following vector and return only the
    `min`, `mean`, and `sd.` (Recall the `na.rm=TRUE` argument for many
    of the basic summary functions.

``` r
x <- c(runif(10), NA)
```

``` r
mySummary(x, max = FALSE, med = FALSE, mean = TRUE, sd = TRUE, na.rm = TRUE)
```

    ## $Minimum
    ## [1] 0.2320222
    ## 
    ## $Mean
    ## [1] 0.4887693
    ## 
    ## $SD
    ## [1] 0.2720501

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
