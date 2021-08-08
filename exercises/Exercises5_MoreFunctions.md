Exercises 5 - More Functions
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

2.  Evaluate your function on the following vector and return only the
    `min`, `mean`, and `sd.` (Recall the `na.rm=TRUE` argument for many
    of the basic summary functions.

``` r
x <- c(runif(10), NA)
```

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
