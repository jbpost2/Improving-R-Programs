Exercises 1 - Loops
================

-   Create a for loop iterating from 1 to 26 that prints the statement

> (letter) is the (nth) letter of the alphabet.

at each iteration.

-   Use the built-in `letters` vector to get the letters and
    `scales::ordinal(1:26)` to create a vector of the numbers with
    suffixes.  
-   Combine all the strings together with the `paste()` function.  
-   Place that line of code inside a `print()` function.

For example,  
`print(paste(letters[1], "is the", scales::ordinal(1), "letter of the alphabet."))`

<hr>

<br>

<a href = "https://jbpost2.github.io/Improving-R-Programs/CourseFiles.html"><button type="button">Course
Files Page</button></a>
