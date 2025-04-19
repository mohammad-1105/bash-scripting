#!/bin/bash

# Comparing Numbers in Bash (Arithmetic Operators)

# When you're working with numbers in your scripts, you'll often need to compare
# them. Bash provides these special operators to help you do just that. Think
# of them as asking questions about the relationship between two numbers.

# Checking if two numbers are equal:
[[ "${number1}" -eq "${number2}" ]] # True if '${number1}' is the same as '${number2}'.
# Example: [[ 10 -eq 10 ]] is true.
# Example: [[ 10 -eq 20 ]] is false.

# Checking if two numbers are not equal:
[[ "${number1}" -ne "${number2}" ]] # True if '${number1}' is different from '${number2}'.
# Example: [[ 5 -ne 10 ]] is true.
# Example: [[ 7 -ne 7 ]] is false.

# Checking if the first number is less than the second:
[[ "${number1}" -lt "${number2}" ]] # True if '${number1}' is smaller than '${number2}'.
# Example: [[ 3 -lt 7 ]] is true.
# Example: [[ 7 -lt 3 ]] is false.

# Checking if the first number is less than or equal to the second:
[[ "${number1}" -le "${number2}" ]] # True if '${number1}' is smaller than or the same as '${number2}'.
# Example: [[ 5 -le 5 ]] is true.
# Example: [[ 2 -le 6 ]] is true.

# Checking if the first number is greater than the second:
[[ "${number1}" -gt "${number2}" ]] # True if '${number1}' is bigger than '${number2}'.
# Example: [[ 9 -gt 4 ]] is true.
# Example: [[ 4 -gt 9 ]] is false.

# Checking if the first number is greater than or equal to the second:
[[ "${number1}" -ge "${number2}" ]] # True if '${number1}' is bigger than or the same as '${number2}'.
# Example: [[ 12 -ge 10 ]] is true.
# Example: [[ 8 -ge 8 ]] is true.

# Important: These operators work with whole numbers (integers), both positive
# (like 5, 10) and negative (like -3, -7).

# Combining Multiple Conditions (Using AND and OR):

# Sometimes, you need to check if more than one thing is true at the same time (AND),
# or if at least one of several things is true (OR).

# AND (both conditions must be true):
[[ "${condition1}" ]] && [[ "${condition2}" ]]
# Example:
age=25
city="New York"
if [[ "$age" -gt 18 ]] && [[ "$city" == "New York" ]]; then
    echo "Adult in New York."
fi
# This will print "Adult in New York." because both conditions are true.

# OR (at least one condition must be true):
[[ "${condition1}" ]] || [[ "${condition2}" ]]
# Example:
day="Saturday"
weather="sunny"
if [[ "$day" == "Saturday" ]] || [[ "$weather" == "rainy" ]]; then
    echo "It's either Saturday or it's raining (or both!)."
fi
# This will print the message because the first condition (day is Saturday) is true.

# Checking the Success of the Last Command (Exit Status Operators):

# When you run a command in Bash, Bash keeps track of whether that command
# finished successfully or if it encountered any errors. This is recorded as
# an "exit status," which is just a number.

# - An exit status of 0 usually means the last command worked perfectly without
#   any issues. Think of it as a "pass" or "success" report.

# - A non-zero exit status (like 1, 2, 127, etc.) means that the last command
#   had some kind of problem. The specific non-zero number can sometimes give
#   you a clue about what went wrong.

# You can access the exit status of the last run command using a special Bash
# variable: '$?'.

# Now, let's see how to use this exit status to make decisions in your scripts:

# 1. Checking for Success ([[ $? -eq 0 ]]):

# This is like asking Bash: "Hey, did the very last command we ran have an exit
# status of 0? (Did it succeed?)"

# Example:
# Let's try a command that usually works (listing a file):
ls -l my_existing_file.txt

if [[ $? -eq 0 ]]; then
    echo "The 'ls' command to list 'my_existing_file.txt' was successful!"
else
    echo "Oops! The 'ls' command had some trouble listing 'my_existing_file.txt'."
fi

# Now, let's try a command that might fail (listing a file that probably doesn't exist):
ls -l a_file_that_doesnt_exist.txt

if [[ $? -eq 0 ]]; then
    echo "The second 'ls' command also ran successfully!" # This is unlikely
else
    echo "Ah, the second 'ls' command had an issue (as expected, the file might not exist)."
fi
