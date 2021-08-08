Exercises 3 - apply Solutions
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

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   `fixed acidity` = col_double(),
    ##   `volatile acidity` = col_double(),
    ##   `citric acid` = col_double(),
    ##   `residual sugar` = col_double(),
    ##   chlorides = col_double(),
    ##   `free sulfur dioxide` = col_double(),
    ##   `total sulfur dioxide` = col_double(),
    ##   density = col_double(),
    ##   pH = col_double(),
    ##   sulphates = col_double(),
    ##   alcohol = col_double(),
    ##   quality = col_double()
    ## )

1.  Find the column means.

``` r
colMeans(wineData)
```

    ##        fixed acidity     volatile acidity          citric acid 
    ##           8.31963727           0.52782051           0.27097561 
    ##       residual sugar            chlorides  free sulfur dioxide 
    ##           2.53880550           0.08746654          15.87492183 
    ## total sulfur dioxide              density                   pH 
    ##          46.46779237           0.99674668           3.31111320 
    ##            sulphates              alcohol              quality 
    ##           0.65814884          10.42298311           5.63602251

2.  Find the column standard deviations. Note that you will need to
    coerce the `tibble` to a `matrix` (use `as.matrix()`) in order to
    use the `colSds` function from the `matrixStats` package.
    (Alternatively, you can use the `apply()` function.)

``` r
matrixStats::colSds(as.matrix(wineData))
```

    ##  [1]  1.741096318  0.179059704  0.194801137  1.409928060  0.047065302
    ##  [6] 10.460156970 32.895324478  0.001887334  0.154386465  0.169506980
    ## [11]  1.065667582  0.807569440

``` r
#or 
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
as.matrix(wineData) %>% matrixStats::colSds()
```

    ##  [1]  1.741096318  0.179059704  0.194801137  1.409928060  0.047065302
    ##  [6] 10.460156970 32.895324478  0.001887334  0.154386465  0.169506980
    ## [11]  1.065667582  0.807569440

``` r
#or
apply(wineData, MARGIN = 2, FUN = sd)
```

    ##        fixed acidity     volatile acidity          citric acid 
    ##          1.741096318          0.179059704          0.194801137 
    ##       residual sugar            chlorides  free sulfur dioxide 
    ##          1.409928060          0.047065302         10.460156970 
    ## total sulfur dioxide              density                   pH 
    ##         32.895324478          0.001887334          0.154386465 
    ##            sulphates              alcohol              quality 
    ##          0.169506980          1.065667582          0.807569440

3.  Use the `apply()` function along with the `summary()` function to
    find summaries about the columns.

``` r
apply(wineData, MARGIN = 2, FUN = summary)
```

    ##         fixed acidity volatile acidity citric acid residual sugar  chlorides
    ## Min.         4.600000        0.1200000   0.0000000       0.900000 0.01200000
    ## 1st Qu.      7.100000        0.3900000   0.0900000       1.900000 0.07000000
    ## Median       7.900000        0.5200000   0.2600000       2.200000 0.07900000
    ## Mean         8.319637        0.5278205   0.2709756       2.538806 0.08746654
    ## 3rd Qu.      9.200000        0.6400000   0.4200000       2.600000 0.09000000
    ## Max.        15.900000        1.5800000   1.0000000      15.500000 0.61100000
    ##         free sulfur dioxide total sulfur dioxide   density       pH sulphates
    ## Min.                1.00000              6.00000 0.9900700 2.740000 0.3300000
    ## 1st Qu.             7.00000             22.00000 0.9956000 3.210000 0.5500000
    ## Median             14.00000             38.00000 0.9967500 3.310000 0.6200000
    ## Mean               15.87492             46.46779 0.9967467 3.311113 0.6581488
    ## 3rd Qu.            21.00000             62.00000 0.9978350 3.400000 0.7300000
    ## Max.               72.00000            289.00000 1.0036900 4.010000 2.0000000
    ##          alcohol  quality
    ## Min.     8.40000 3.000000
    ## 1st Qu.  9.50000 5.000000
    ## Median  10.20000 6.000000
    ## Mean    10.42298 5.636023
    ## 3rd Qu. 11.10000 6.000000
    ## Max.    14.90000 8.000000

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

``` r
lapply(slrFits, FUN = summary)
```

    ## $`fixed acidity`
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8248 -0.6061  0.1925  0.4341  2.5550 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  5.15732    0.09789  52.684  < 2e-16 ***
    ## x            0.05754    0.01152   4.996  6.5e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8016 on 1597 degrees of freedom
    ## Multiple R-squared:  0.01539,    Adjusted R-squared:  0.01477 
    ## F-statistic: 24.96 on 1 and 1597 DF,  p-value: 6.496e-07
    ## 
    ## 
    ## $`volatile acidity`
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.79071 -0.54411 -0.00687  0.47350  2.93148 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  6.56575    0.05791  113.39   <2e-16 ***
    ## x           -1.76144    0.10389  -16.95   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7437 on 1597 degrees of freedom
    ## Multiple R-squared:  0.1525, Adjusted R-squared:  0.152 
    ## F-statistic: 287.4 on 1 and 1597 DF,  p-value: < 2.2e-16
    ## 
    ## 
    ## $`citric acid`
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0011 -0.5976  0.1021  0.5057  2.5901 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  5.38172    0.03372 159.610   <2e-16 ***
    ## x            0.93845    0.10104   9.288   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7869 on 1597 degrees of freedom
    ## Multiple R-squared:  0.05124,    Adjusted R-squared:  0.05065 
    ## F-statistic: 86.26 on 1 and 1597 DF,  p-value: < 2.2e-16
    ## 
    ## 
    ## $`residual sugar`
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6609 -0.6334  0.3580  0.3690  2.3729 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 5.616055   0.041616 134.950   <2e-16 ***
    ## x           0.007865   0.014331   0.549    0.583    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8077 on 1597 degrees of freedom
    ## Multiple R-squared:  0.0001886,  Adjusted R-squared:  -0.0004375 
    ## F-statistic: 0.3012 on 1 and 1597 DF,  p-value: 0.5832
    ## 
    ## 
    ## $chlorides
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6946 -0.6503  0.3010  0.3607  2.3607 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  5.82948    0.04229 137.852  < 2e-16 ***
    ## x           -2.21184    0.42578  -5.195 2.31e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8011 on 1597 degrees of freedom
    ## Multiple R-squared:  0.01662,    Adjusted R-squared:  0.016 
    ## F-statistic: 26.99 on 1 and 1597 DF,  p-value: 2.313e-07
    ## 
    ## 
    ## $`free sulfur dioxide`
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6864 -0.6394  0.3215  0.3762  2.4661 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  5.698107   0.036678 155.357   <2e-16 ***
    ## x           -0.003911   0.001929  -2.027   0.0428 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8068 on 1597 degrees of freedom
    ## Multiple R-squared:  0.002566,   Adjusted R-squared:  0.001941 
    ## F-statistic: 4.109 on 1 and 1597 DF,  p-value: 0.04283
    ## 
    ## 
    ## $`total sulfur dioxide`
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8063 -0.6336  0.2164  0.3800  2.5527 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  5.8471792  0.0343670 170.140  < 2e-16 ***
    ## x           -0.0045442  0.0006037  -7.527 8.62e-14 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7939 on 1597 degrees of freedom
    ## Multiple R-squared:  0.03426,    Adjusted R-squared:  0.03366 
    ## F-statistic: 56.66 on 1 and 1597 DF,  p-value: 8.622e-14
    ## 
    ## 
    ## $density
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.7885 -0.6216  0.1554  0.4271  2.5177 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)    80.24      10.51   7.636 3.83e-14 ***
    ## x             -74.85      10.54  -7.100 1.87e-12 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7954 on 1597 degrees of freedom
    ## Multiple R-squared:  0.0306, Adjusted R-squared:  0.02999 
    ## F-statistic: 50.41 on 1 and 1597 DF,  p-value: 1.875e-12
    ## 
    ## 
    ## $pH
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6817 -0.6394  0.3032  0.3878  2.4874 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   6.6359     0.4332  15.320   <2e-16 ***
    ## x            -0.3020     0.1307  -2.311    0.021 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8065 on 1597 degrees of freedom
    ## Multiple R-squared:  0.003333,   Adjusted R-squared:  0.002709 
    ## F-statistic:  5.34 on 1 and 1597 DF,  p-value: 0.02096
    ## 
    ## 
    ## $sulphates
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2432 -0.5424  0.1102  0.4456  2.3977 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  4.84775    0.07842   61.82   <2e-16 ***
    ## x            1.19771    0.11539   10.38   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7819 on 1597 degrees of freedom
    ## Multiple R-squared:  0.0632, Adjusted R-squared:  0.06261 
    ## F-statistic: 107.7 on 1 and 1597 DF,  p-value: < 2.2e-16
    ## 
    ## 
    ## $alcohol
    ## 
    ## Call:
    ## lm(formula = wineData$quality ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8442 -0.4112 -0.1690  0.5166  2.5888 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  1.87497    0.17471   10.73   <2e-16 ***
    ## x            0.36084    0.01668   21.64   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7104 on 1597 degrees of freedom
    ## Multiple R-squared:  0.2267, Adjusted R-squared:  0.2263 
    ## F-statistic: 468.3 on 1 and 1597 DF,  p-value: < 2.2e-16

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
