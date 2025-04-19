#!/bin/bash

# If you have ever heard of programming languages, you will know that arrays are a very important part of them.
# In Bash, arrays are a way to store a collection of values in a single variable.

# Let's see how to create an array in Bash:

array=(1 2 3 4 5) # Here 1 2 3 4 5 are the values of the array
# Note: the values are separated by spaces not commas

echo ${array} # Output: 1

# To print all the elements of array
echo ${array[@]} # Output: 1 2 3 4 5

# To print the first element of array
echo ${array[0]} # Output: 1

# To print the last element of array
echo ${array[-1]} # Output: 5

# To print the length of array
echo ${#array[@]} # Output: 5 # Note: `#` before array name represent the length of array and the length of array is 5

# Now to print the length of specific element to array we have to use ${#array[index]}

names=("Aman" "Sakir" "Abdul")
echo ${#names[0]} # Output: 4
echo ${#names[1]} # Output: 5

# NOW Array Slicing
# While Bash doesn't support true array slicing, you can achieve similar results using a combination of array indexing and string slicing:

echo ${names[@]:1:2} # Output: Sakir Abdul [Start from index 1 and take 2 elements of array]
echo ${array[@]:2}   # Output: 3 4 5

# NOW String Slicing
# It's same like array slicing but for strings

strings="Hello World"

# Print the first 5 characters of the string
echo ${strings:0:5} # Output: Hello [here 0 represent the index of first character of string and 5 represent the number of characters to be printed]

# Print the last 5 characters of the string
echo ${strings:6:5} # Output: World

# NOTE:  that the second number in the slice notation represents the
# maximum length of the extracted substring, not the ending index. This
# is different from some other programming languages like Python. In
# Bash, if you specify a length that would extend beyond the end of the
# string, it will simply stop at the end of the string without raising an
# error
