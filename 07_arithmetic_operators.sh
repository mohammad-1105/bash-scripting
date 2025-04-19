# Number Crunching in Bash - Comparing Numbers

# Let's say you have two numbers. These operators help you compare them.

# Are two numbers exactly the same?
[[ "${number1}" -eq "${number2}" ]] # Like asking: "Is ${number1} equal to ${number2}?" (True if yes)
# Example: [[ 10 -eq 10 ]] is true, but [[ 10 -eq 20 ]] is false.

# Are two numbers different?
[[ "${number1}" -ne "${number2}" ]] # Asking: "Is ${number1} NOT equal to ${number2}?" (True if they are different)
# Example: [[ 5 -ne 10 ]] is true, but [[ 7 -ne 7 ]] is false.

# Is the first number smaller than the second?
[[ "${number1}" -lt "${number2}" ]] # Asking: "Is ${number1} LESS THAN ${number2}?" (True if it is)
# Example: [[ 3 -lt 7 ]] is true, but [[ 7 -lt 3 ]] is false.

# Is the first number smaller than or the same as the second?
[[ "${number1}" -le "${number2}" ]] # Asking: "Is ${number1} LESS THAN OR EQUAL TO ${number2}?" (True if it is)
# Example: [[ 5 -le 5 ]] is true, and [[ 2 -le 6 ]] is also true.

# Is the first number bigger than the second?
[[ "${number1}" -gt "${number2}" ]] # Asking: "Is ${number1} GREATER THAN ${number2}?" (True if it is)
# Example: [[ 9 -gt 4 ]] is true, but [[ 4 -gt 9 ]] is false.

# Is the first number bigger than or the same as the second?
[[ "${number1}" -ge "${number2}" ]] # Asking: "Is ${number1} GREATER THAN OR EQUAL TO ${number2}?" (True if it is)
# Example: [[ 12 -ge 10 ]] is true, and [[ 8 -ge 8 ]] is also true.

# Just so you know, the numbers you compare can be positive (like 5, 10) or negative (like -3, -7).

# Combining Conditions (Like saying "this AND that" or "either this OR that")

# AND: Both things must be true.
[[ "${condition1}" ]] && [[ "${condition2}" ]]
# Example: [[ 5 -gt 3 ]] && [[ 10 -lt 15 ]]  (Both are true, so the whole thing is true)

# OR: At least one of the things must be true.
[[ "${condition1}" ]] || [[ "${condition2}" ]]
# Example: [[ 2 -gt 5 ]] || [[ 7 -lt 10 ]]   (The second one is true, so the whole thing is true)

# Exit Status Operators

# Every time you run a command in Bash (like ls, mkdir, or even a script you wrote), that command finishes with a little report card called an "exit status." This is just a number.

# A zero (0) exit status usually means "Success!" The command did what it was supposed to do without any problems.
# A non-zero exit status (like 1, 2, 127, etc.) usually means "Something went wrong." The number itself can sometimes give you a hint about the type of error.
# Now, let's look at the operators:

# 1. [[ $? -eq 0 ]] - Was the Last Command Successful?

# Imagine you just asked Bash to do something, and you want to know if it worked. $? is a special Bash variable that holds the exit status of the last command that was executed.

# So, [[ $? -eq 0 ]] is like asking: "Hey Bash, was the exit status of the very last thing you did equal to zero (meaning success)?"

# Example:
# Let's try a command that usually works
ls -l my_file.txt

if [[ $? -eq 0 ]]; then
    echo "The 'ls' command ran successfully!"
else
    echo "Oops! The 'ls' command had some trouble."
fi

# Now let's try a command that might fail (if the file doesn't exist)
ls -l non_existent_file.txt

if [[ $? -eq 0 ]]; then
    echo "The second 'ls' command also ran successfully!" # This probably won't happen
else
    echo "Ah, the second 'ls' command had an issue (as expected!)."
fi
