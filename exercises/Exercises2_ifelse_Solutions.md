Exercises 2 - if else Solutions
================

FizzBuzz is a common programming problem
<https://en.wikipedia.org/wiki/Fizz_buzz> used to practice if statements
and division.

For our version, create a vector `test_vec` of the numbers 1 to 50
(`1:50`). Then apply the following rules using `dplyr::if_else`
statements to obtain the appropriate behavior:

-   if the number is divisible by 3, output “Fizz”
-   if the number is divisible by 5, output “Buzz”
-   if the number is divisible by 15, output “FizzBuzz”
-   otherwise, return the number as a character (`as.character()`)

Notes:  
- `%%` will give the remainder or a division (for instance `15 %% 3` is
0 and `16 %% 3` is 1). You can use this function and check if the
remainder is 0.  
- You have to start with checking 15 and then you can do 5 or 3 after
that.

``` r
test_vec <- 1:50
library(dplyr)
if_else(test_vec %% 15 == 0, "FizzBuzz", 
       if_else(test_vec %% 3 == 0, "Fizz", 
              if_else(test_vec %% 5 ==0, "Buzz", as.character(test_vec))
              )
      )
```

    ##  [1] "1"        "2"        "Fizz"     "4"        "Buzz"     "Fizz"    
    ##  [7] "7"        "8"        "Fizz"     "Buzz"     "11"       "Fizz"    
    ## [13] "13"       "14"       "FizzBuzz" "16"       "17"       "Fizz"    
    ## [19] "19"       "Buzz"     "Fizz"     "22"       "23"       "Fizz"    
    ## [25] "Buzz"     "26"       "Fizz"     "28"       "29"       "FizzBuzz"
    ## [31] "31"       "32"       "Fizz"     "34"       "Buzz"     "Fizz"    
    ## [37] "37"       "38"       "Fizz"     "Buzz"     "41"       "Fizz"    
    ## [43] "43"       "44"       "FizzBuzz" "46"       "47"       "Fizz"    
    ## [49] "49"       "Buzz"

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
