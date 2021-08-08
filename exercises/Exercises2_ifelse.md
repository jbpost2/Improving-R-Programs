Exercises 2 - if else
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

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
