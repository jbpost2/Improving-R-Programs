Exercises 4 - Basic Functions Solutions
================

1.  Write your own absolute value function called `myAbsoluteValue.`
    There are two options for what to do with the input:  

-   If x is positive or zero, return x.
-   If x is negative, return -x.

Allow the function to take in an entire vector of values by using
`if_else()` to do your comparison.

``` r
myAbsoluteValue <- function(vector) {
    return(dplyr::if_else(vector >= 0, vector, -vector))
}
```

2.  Check your function works by plugging in the values below.

``` r
3
-5
c(3, -5)
-10:10
```

``` r
myAbsoluteValue(3)
```

    ## [1] 3

``` r
myAbsoluteValue(-5)
```

    ## [1] 5

``` r
myAbsoluteValue(c(3, -5))
```

    ## [1] 3 5

``` r
myAbsoluteValue(-10:10)
```

    ##  [1] 10  9  8  7  6  5  4  3  2  1  0  1  2  3  4  5  6  7  8  9 10

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
