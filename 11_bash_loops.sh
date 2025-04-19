#!/bin/bash

# Making Things Repeat: Loops in Bash

# Loops are a super handy tool in programming. They let you run a set of
# commands multiple times without having to write them out over and over again.
# Bash offers three main types of loops: 'for', 'while', and 'until'.

# The 'for' Loop: Doing something for each item in a list.

# Basic Structure of a 'for' Loop:
# for item in list_of_items; do
#   # Commands to run for each 'item'
# done
# Remember to end the loop with the 'done' keyword.

# Example 1: Looping through a list of numbers
for number in 1 2 3 4 5; do
    echo "The current number is: ${number}"
done
# This will print each number from 1 to 5.

# Example 2: Looping through a range of numbers
# You can use curly braces '{}' to create a sequence of numbers.
for num in {1..5}; do
    echo "Another number: ${num}"
done
# This does the same as the previous example, but it's easier for larger ranges.
# You can even specify a step, like '{1..10..2}' for 1, 3, 5, 7, 9.

# Example 3: Looping through a list of words
users="alice bob charlie"
for user in ${users}; do
    echo "Hello, ${user}!"
done
# Because the names are separated by spaces in the 'users' variable, Bash
# treats each name as a separate item in the list.

# Example 4: Looping through an array
fruits=("apple" "banana" "orange" "mango" "pineapple")
for fruit in "${fruits[@]}"; do
    echo "The current fruit is: ${fruit}"
    if [[ "${fruit}" == "apple" ]]; then
        echo "An apple a day keeps the doctor away!"
    fi
done
# "${fruits[@]}" expands to all elements of the array. It's important to quote
# it to handle spaces within array elements correctly (though there aren't any here).

# The 'while' Loop: Doing something as long as a condition is true.

# Basic Structure of a 'while' Loop:
# while [[ condition ]]; do
#   # Commands to run as long as 'condition' is true
# done

# Example 1: Counting up to 5
count=1
while [[ "${count}" -le 5 ]]; do
    echo "The count is: ${count}"
    ((count++)) # Increment the 'count' variable by 1.
done
# This loop will continue to run as long as 'count' is less than or equal to 5.

# Another way to write the condition in a 'while' loop using arithmetic brackets:
count=1
while ((count <= 5)); do
    echo "Again, the count is: ${count}"
    ((count++))
done
# The '(())' are specifically for arithmetic comparisons.

# Important Note: Inside '(())', you can use standard arithmetic operators like
# '<=', '>', etc., without the '-le', '-gt' prefixes, and spaces around the
# operators are optional but can improve readability.

# Example 2: Getting valid user input
while true; do # This creates a loop that will run forever until we 'break' out.
    read -p "Enter your name (at least 3 characters): " name

    if [[ -n "${name}" ]] && [[ "${#name}" -ge 3 ]]; then
        echo "Welcome, ${name}!"
        break # 'break' exits the current loop.
    elif [[ -z "${name}" ]]; then
        echo "Your name can't be empty. Please try again."
    else
        echo "Name must be at least 3 characters long. Please try again."
    fi
done

# The 'until' Loop: Doing something until a condition becomes true.

# Basic Structure of an 'until' Loop:
# until [[ condition ]]; do
#   # Commands to run until 'condition' is true
# done
# The 'until' loop is like a 'while' loop that runs as long as the condition is FALSE.

# Example 1: Counting up to 5 using 'until'
count=1
until ((count > 5)); do
    echo "The count is now: ${count}"
    ((count++))
done
# This loop will continue until 'count' becomes greater than 5.

# Example 2: Getting valid user input using 'until'
read -p "Enter your name (at least 3 characters): " name

until [[ -n "${name}" ]] && [[ "${#name}" -ge 3 ]]; do
    echo "Invalid name. Please enter a name with at least 3 characters."
    read -p "Enter your name (at least 3 characters): " name
done

echo "Finally! Welcome, ${name}!"

# Controlling Loops: 'continue' and 'break'

# 'continue': Skips the rest of the commands in the current iteration of the
# loop and moves to the next iteration.
# 'break': Exits the loop entirely, and the script continues with the command
# following the loop.

# Example 1 with 'continue':
heroes=("Spiderman" "Ironman" "Hulk" "Thor" "Batman")

for hero in "${heroes[@]}"; do
    if [[ "${hero}" == "Ironman" ]]; then
        echo "I am a fan of ${hero}!"
        continue # Skip the 'echo "Not Ironman: ${hero}"' for Ironman and go to the next hero.
    fi
    echo "Not Ironman: ${hero}"
done
# Output:
# Not Ironman: Spiderman
# I am a fan of Ironman!
# Not Ironman: Hulk
# Not Ironman: Thor
# Not Ironman: Batman

# Example 2 with 'break':
heroes=("Spiderman" "Ironman" "Hulk" "Thor" "Batman")

for hero in "${heroes[@]}"; do
    if [[ "${hero}" == "Ironman" ]]; then
        echo "Found my favorite: ${hero}!"
        break # Exit the loop immediately after finding "Ironman".
    fi
    echo "Checking hero: ${hero}"
done
# Output:
# Checking hero: Spiderman
# Found my favorite: Ironman!

# Example 3 with 'break' and nested loops:
for ((i = 0; i <= 2; i++)); do
    echo "Outer Loop: i = ${i}"
    for ((j = 0; j <= 2; j++)); do
        echo "  Inner Loop: j = ${j}"
        if ((j == 1)); then
            echo "    Breaking out of the inner loop."
            break # Exits only the innermost 'for' loop.
        fi
    done
done
# Output:
# Outer Loop: i = 0
#   Inner Loop: j = 0
#   Inner Loop: j = 1
#     Breaking out of the inner loop.
# Outer Loop: i = 1
#   Inner Loop: j = 0
#   Inner Loop: j = 1
#     Breaking out of the inner loop.
# Outer Loop: i = 2
#   Inner Loop: j = 0
#   Inner Loop: j = 1
#     Breaking out of the inner loop.

echo "" # Add a newline for clarity

for ((i = 0; i <= 2; i++)); do
    echo "Outer Loop with break 2: i = ${i}"
    for ((j = 0; j <= 2; j++)); do
        echo "  Inner Loop with break 2: j = ${j}"
        if ((j == 1)); then
            echo "    Breaking out of BOTH loops!"
            break 2 # Exits the outer loop as well (level 2).
        fi
    done
done
# Output:
# Outer Loop with break 2: i = 0
#   Inner Loop with break 2: j = 0
#   Inner Loop with break 2: j = 1
#     Breaking out of BOTH loops!

# Note on 'break N': 'break' with a number 'N' after it is used to break out
# of 'N' enclosing loops. 'break 1' (or just 'break') exits the innermost loop.
# 'break 2' exits the two innermost loops, and so on, if you have nested loops.
