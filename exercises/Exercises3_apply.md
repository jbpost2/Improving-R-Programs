Exercises 3 - apply
================

We will use a dataset from the UCI Machine Learning Repository. This
data set is about wine quality (we’ll consider the red wine data). You
can learn more about the data
[here](https://archive.ics.uci.edu/ml/datasets/Wine+Quality).

The data description describes the following variables:

> Input variables (based on physicochemical tests)  
> 1 - fixed acidity  
> 2 - volatile acidity  
> 3 - citric acid  
> 4 - residual sugar  
> 5 - chlorides  
> 6 - free sulfur dioxide  
> 7 - total sulfur dioxide  
> 8 - density  
> 9 - pH  
> 10 - sulphates  
> 11 - alcohol

> Output variable (based on sensory data):  
> 12 - quality (score between 0 and 10)

Read in the data using the code below.

``` r
wineData <- readr::read_delim("https://raw.githubusercontent.com/jbpost2/Improving-R-Programs/master/datasets/winequality-red.csv", delim = ";")
```

1.  Find the column means.

2.  Find the column standard deviations. Note that you will need to
    coerce the `tibble` to a `matrix` (use `as.matrix()`) in order to
    use the `colSds` function from the `matrixStats` package.
    (Alternatively, you can use the `apply()` function.)

3.  Use the `apply()` function along with the `summary()` function to
    find summaries about the columns.

4.  Run the code below to fit a simple linear regression model for
    quality using each of the variables (columns in the data set). We’ll
    learn more about writing functions in a bit!

``` r
slrFits <- apply(wineData[,-ncol(wineData)], MARGIN = 2, function(x){lm(wineData$quality ~ x)})
```

`slrFits` is a list object where each element has the results of a call
to `lm()` (which itself is a list of length 12).

``` r
str(slrFits, max.level = 1)
```

    ## List of 11
    ##  $ fixed acidity       :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ volatile acidity    :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ citric acid         :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ residual sugar      :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ chlorides           :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ free sulfur dioxide :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ total sulfur dioxide:List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ density             :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ pH                  :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ sulphates           :List of 12
    ##   ..- attr(*, "class")= chr "lm"
    ##  $ alcohol             :List of 12
    ##   ..- attr(*, "class")= chr "lm"

Use `lapply()` to run the `summary()` function on each SLR fit. This
should output p-values and info about each model fit.

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
