Exercises 6 - Last Functions Solutions
================

1.  Write your own infix function that can be used in place of the
    `cbind()` (or column bind) function. Feel free to call the `cbind`
    function in your function :)

    ``` r
    `%col%` <- function(df1, df2) {cbind(df1, df2)}
    ```

2.  Check that the function works on the two data frames below (`df1` &
    `df2`) and then all three objects (`df1`, `df2`, `vec1`)!

    ``` r
    set.seed(1)
    df1 <- data.frame(unif = runif(10), norm = rnorm(10))
    df2 <- data.frame(gamma = rgamma(10, shape = 1), beta = rbeta(10, shape1 = 5, shape2 = 1))
    vec1 <- rnorm(10, mean = 10)
    ```

    ``` r
    df1 %col% df2
    ```

        ##          unif       norm      gamma      beta
        ## 1  0.26550866 -0.8204684 0.46873190 0.6981448
        ## 2  0.37212390  0.4874291 0.06819735 0.9073484
        ## 3  0.57285336  0.7383247 1.24929214 0.9812697
        ## 4  0.90820779  0.5757814 1.00813135 0.8092792
        ## 5  0.20168193 -0.3053884 1.36094498 0.9031133
        ## 6  0.89838968  1.5117812 1.20598818 0.8210630
        ## 7  0.94467527  0.3898432 0.55411539 0.7195054
        ## 8  0.66079779 -0.6212406 1.20700260 0.7262717
        ## 9  0.62911404 -2.2146999 1.56247866 0.8197674
        ## 10 0.06178627  1.1249309 0.13077616 0.9695648

    ``` r
    df1 %col% df2 %col% vec1
    ```

        ##          unif       norm      gamma      beta       df2
        ## 1  0.26550866 -0.8204684 0.46873190 0.6981448 10.763176
        ## 2  0.37212390  0.4874291 0.06819735 0.9073484  9.835476
        ## 3  0.57285336  0.7383247 1.24929214 0.9812697  9.746638
        ## 4  0.90820779  0.5757814 1.00813135 0.8092792 10.696963
        ## 5  0.20168193 -0.3053884 1.36094498 0.9031133 10.556663
        ## 6  0.89838968  1.5117812 1.20598818 0.8210630  9.311244
        ## 7  0.94467527  0.3898432 0.55411539 0.7195054  9.292505
        ## 8  0.66079779 -0.6212406 1.20700260 0.7262717 10.364582
        ## 9  0.62911404 -2.2146999 1.56247866 0.8197674 10.768533
        ## 10 0.06178627  1.1249309 0.13077616 0.9695648  9.887654

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
