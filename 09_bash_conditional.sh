#!/bin/bash

# Putting Conditions to Work: The 'if' Statement in Bash

# In the previous chapter, we looked at different ways to ask Bash questions
# (conditional expressions). Now, let's learn how to use those questions to
# make our scripts take different actions using the 'if' statement.

# The Basic Structure of an 'if' Statement:

# if [[ condition ]]; then
#   # Commands to run if the 'condition' is true
# else
#   # Optional: Commands to run if the 'condition' is false
# fi

# Let's look at some examples to see how this works in practice.

# Example 1: A Simple Numerical Comparison
if [[ 5 -gt 3 ]]; then
    echo "5 is greater than 3"
else
    echo "5 is not greater than 3"
fi
# Explanation: This checks if 5 is greater than 3. Since it is true, it will
# output "5 is greater than 3". The 'else' part is skipped.

# Example 2: Checking if a User Entered Their Name
read -p "What is your name? " name

if [[ -z "${name}" ]]; then
    echo "Please enter your name."
else
    echo "Hi there, ${name}!"
fi
# Explanation: '-z "${name}"' checks if the 'name' variable is empty. If it is,
# the first message is shown. Otherwise, the greeting with the name is displayed.
# (Remember from Chapter 6, '-z' checks for an empty string).

# Example 3: Basic Username and Password Check
username="sakir"
password="1234"

read -p "Enter your username: " input_username
read -s -p "Enter your password: " input_password

if [[ "${input_username}" == "${username}" && "${input_password}" == "${password}" ]]; then
    echo "You are logged in."
else
    echo "Invalid username or password."
fi
# Explanation: This uses the '&&' (AND) operator to check if both the entered
# username AND the entered password match the stored values. The '-s' flag in
# the second 'read' command hides the password as the user types it.

# Important Note about '-s' flag:
# The '-s' flag with the 'read' command is used for security. It prevents the
# user's input (like a password) from being displayed on the screen as they type it.
# You can use the '-p' flag with 'read' to show a prompt message to the user.

# Example 4: Using Different Brackets for Conditions
# Bash offers two main ways to define conditions in 'if' statements:
# - '[[ ... ]]': More flexible and feature-rich.
# - '(( ... ))': Primarily used for arithmetic (mathematical) operations.

# Let's see an example with arithmetic comparison using '(())':
if ((5 > 3)); then
    echo "5 is greater than 3 (using arithmetic brackets)."
else
    echo "5 is not greater than 3 (using arithmetic brackets)."
fi
# Explanation: The '(())' brackets treat the content inside as a mathematical
# expression. Here, it checks if 5 is greater than 3, just like the '[[ ... ]]'
# example with '-gt'.

# Example 5: Checking the User ID to Prevent Running as Root
if ((EUID == 0)); then
    echo "Please do not run this script as the 'root' user. It can be dangerous."
    exit 1 # It's good practice to exit with a non-zero status to indicate an error.
else
    echo "You are not running as the 'root' user."
fi
# Explanation: '$EUID' is a special Bash variable that holds the current user's
# Effective User ID. '0' is the User ID of the 'root' user (the system administrator).
# This code checks if the script is being run as root and, if so, displays a
# warning and exits. This is a common security practice.

# Important Syntax Notice:
# When using '[[ ... ]]', you generally need to have spaces around the operators
# and the values you are comparing (e.g., '[[ 5 -gt 3 ]]').
# However, when using '(())', you don't need spaces around the operators and values
# (e.g., '((5 > 3))' is perfectly valid). Using spaces inside '(())' is still
# acceptable and can improve readability (e.g., '(( 5 > 3 ))').
