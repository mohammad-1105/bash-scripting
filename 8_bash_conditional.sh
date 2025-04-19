#!/bin/bash

# we have covered some of the most popular conditional expressions without introducing them. We can now use them with standard conditional statements like if, if-else and switch case statements.

# The format of if statement in bash:

# if [[ something ]]; then
#     # do something
# else
#     # do something else
# fi

# A Quick example

# Example 1
if [[ 5 -gt 3 ]]; then
    echo "5 is greater than 3"
else
    echo "5 is not greater than 3"
fi

# Example 2
read -p "What is your name ? " name

if [[ -z ${name} ]]; then
    echo "Please enter your name"
else
    echo "Hi there, ${name}"
fi

# If we remember -z ${name} means if name is empty. For more details go back to chapter 5

# Example 3

username="sakir"
password="1234"

read -p "Enter your username: " input_username
read -s -p "Enter your password: " input_password

if [[ ${input_username} == ${username} && ${input_password} == ${password} ]]; then
    echo "You are logged in"
else
    echo "Invalid username or password"
fi

# Important Note: we use -s flag to hide the password from the screen when the user enters it. You can use -p flag to show the password on the screen

# Example 4
# Now we have two ways to handle conditions in if-else
# one is with (()) bracket and another is with [[ ]] square brackets.
# The main purpose to use (()) bracket is when you are dealing with mathematical operations. For example: (( 5 > 3 )) will return true if 5 is greater than 3. On the other hand, [[ ]] square brackets are more flexible and can handle more complex conditions.
# Let's see

if ((5 > 3)); then
    echo "5 is greater than 3"
else
    echo "5 is not greater than 3"
fi

# Example 5
# This is an example of an if statement which would check your current 'User ID' and would not allow you to run the script as the 'root' user

if (($EUID == 0)); then
    echo "Please do not run the script as root"
    exit 1
else
    echo "You are not root"
fi

# Important Notice: when you use [[]] in your script you must have to leave spaces aroung the condition like [[ 5 -gt 3 ]] but when you use (()) in your script you don't have to leave spaces around the condition like ((5 -gt 3))
