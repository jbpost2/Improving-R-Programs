Exercises 6 - Last Functions
================

1.  Write your own infix function that can be used in place of the
    `cbind()` (or column bind) function. Feel free to call the `cbind`
    function in your function :)  

2.  Check that the function works on the two data frames below (`df1` &
    `df2`) and then all three objects (`df1`, `df2`, `vec1`)!

    ``` r
    set.seed(1)
    df1 <- data.frame(unif = runif(10), norm = rnorm(10))
    df2 <- data.frame(gamma = rgamma(10, shape = 1), beta = rbeta(10, shape1 = 5, shape2 = 1))
    vec1 <- rnorm(10, mean = 10)
    ```

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
