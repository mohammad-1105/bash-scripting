#!/bin/bash

# Working with Arrays in Bash

# Arrays are a way to store a list of items (values) under a single name.

# Creating an array:
my_numbers=(10 20 30 40 50) # Values are separated by spaces.

echo "${my_numbers}" # Shows only the first element: 10

# To see all items in the array:
echo "${my_numbers[@]}" # Output: 10 20 30 40 50

# Getting a specific item (element) by its position (index):
# Array positions start from 0.
echo "${my_numbers[0]}" # Output: 10 (the first item)

# Getting the last item:
echo "${my_numbers[@]: -1}" # Output: 50

# Finding out how many items are in the array:
echo "${#my_numbers[@]}" # Output: 5 (there are 5 items)
# '#' before the array name with '@' inside gives the total count.

# Finding the length of a specific item (string) in the array:
names=("Aman" "Sakir" "Charlie")
echo "${#names[0]}" # Output: 5 (length of "Aman")
echo "${#names[1]}" # Output: 3 (length of "Sakir")

# Getting a part of the array (Array "Slicing"):
# You can pick out a section of the array.

echo "${names[@]:1:2}" # Output: Sakir Charlie
# Start at position 1, take 2 items.

echo "${my_numbers[@]:2}" # Output: 30 40 50
# Start at position 2 and take all remaining items.

# Working with parts of text (String Slicing):

text="Bash Scripting"

# Get the first 4 letters:
echo "${text:0:4}" # Output: Bash
# Start at the first letter (position 0), take 4 letters.

# Get letters from position 5 onwards:
echo "${text:5}" # Output: Scripting

# Get the last 7 letters:
echo "${text: -7}" # Output: cripting

# Important note about string slicing length:
# The second number after the colon in string slicing (like in "${text:0:4}")
# tells Bash the maximum number of characters to grab, not the position to stop.
# If you ask for more characters than are left in the string, it will just give
# you the rest of the string without any errors. This is different from how
# slicing works in some other languages like Python."
