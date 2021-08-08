Exercises 1 - Loops Solutions
================

# For Loop Creation

1.  Create a for loop iterating from 1 to 26 that prints the statement
    “\* is the n-th letter of the alphabet.” in each iteration. Use the
    built-in ‘letters’ vector to get the letters and use the
    `scales::ordinal` function to create a vector of the numbers with
    suffixes. Then combine all the strings together with the `paste`
    function, and put the whole thing inside a `print` statement.

``` r
suffix <- scales::ordinal(1:26)

for(l in 1:26){
  print(paste(letters[l], "is the", suffix[l] ,"letter of the alphabet."))
}
```

    ## [1] "a is the 1st letter of the alphabet."
    ## [1] "b is the 2nd letter of the alphabet."
    ## [1] "c is the 3rd letter of the alphabet."
    ## [1] "d is the 4th letter of the alphabet."
    ## [1] "e is the 5th letter of the alphabet."
    ## [1] "f is the 6th letter of the alphabet."
    ## [1] "g is the 7th letter of the alphabet."
    ## [1] "h is the 8th letter of the alphabet."
    ## [1] "i is the 9th letter of the alphabet."
    ## [1] "j is the 10th letter of the alphabet."
    ## [1] "k is the 11th letter of the alphabet."
    ## [1] "l is the 12th letter of the alphabet."
    ## [1] "m is the 13th letter of the alphabet."
    ## [1] "n is the 14th letter of the alphabet."
    ## [1] "o is the 15th letter of the alphabet."
    ## [1] "p is the 16th letter of the alphabet."
    ## [1] "q is the 17th letter of the alphabet."
    ## [1] "r is the 18th letter of the alphabet."
    ## [1] "s is the 19th letter of the alphabet."
    ## [1] "t is the 20th letter of the alphabet."
    ## [1] "u is the 21st letter of the alphabet."
    ## [1] "v is the 22nd letter of the alphabet."
    ## [1] "w is the 23rd letter of the alphabet."
    ## [1] "x is the 24th letter of the alphabet."
    ## [1] "y is the 25th letter of the alphabet."
    ## [1] "z is the 26th letter of the alphabet."

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
