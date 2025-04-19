#!/bin/bash

# Making Choices with the 'case' Statement (Switch Case) in Bash

# The 'case' statement is another way to control the flow of your script based
# on the value of a variable or an expression. It's particularly useful when
# you have several specific values to check against. Think of it as a more
# organized way of writing multiple 'if-elif-else' statements when you're
# comparing one main value.

# The Basic Structure of a 'case' Statement:

# case expression in
#   pattern1)
#     # Code to execute if 'expression' matches 'pattern1'
#     ;;
#   pattern2)
#     # Code to execute if 'expression' matches 'pattern2'
#     ;;
#   pattern3)
#     # Code to execute if 'expression' matches 'pattern3'
#     ;;
#   *)
#     # Code to execute if 'expression' does NOT match any of the above patterns
#     ;;
# esac

# Important: Don't forget to end the 'case' statement with the 'esac' keyword
# (which is 'case' spelled backward). The double semicolon ';;' is crucial for
# ending each case's code block.

# A Simple Example:

# Example 1: Checking a Number Entered by the User
read -p "Enter a number: " number

case "$number" in # It's good practice to quote the variable being tested.
1)
    echo "You entered 1."
    ;;
2)
    echo "You entered 2."
    ;;
3)
    echo "You entered 3."
    ;;
*) # The default case (like 'else')
    echo "You entered: ${number}."
    ;;
esac

# Understanding the Blueprint:

# 1. 'case expression in': This is the starting point. You tell Bash what value
#    you want to check (the 'expression', often a variable) and use the keyword
#    'in' to introduce the different cases.

# 2. 'pattern)': Each 'pattern' is a value or a set of values you want to compare
#    the 'expression' against. The pattern ends with a closing parenthesis ')'.

# 3. Commands to Execute: After each 'pattern)', you write the Bash commands that
#    should be executed if the 'expression' matches that 'pattern'.

# 4. ';;' (Double Semicolon): This is the terminator for each case. When a
#    match is found and the commands for that case are executed, Bash stops
#    checking further cases and jumps to the command after 'esac'. If you forget
#    ';;', the script will "fall through" to the next case, which is usually not
#    what you want.

# 5. '*': The Asterisk (Default Case): The '*' acts as a wildcard that matches
#    anything that didn't match any of the preceding patterns. It's like the
#    'else' in an 'if-elif-else' structure. It's often used to handle unexpected
#    or default values.

# 6. 'esac': This marks the end of the entire 'case' statement.

# Example 2: A More General Structure
case "${variable_to_check}" in
"value_one")
    # Commands for when variable_to_check is "value_one"
    ;;
"value_two" | "another_value")
    # Commands for when it's "value_two" OR "another_value" (using '|')
    ;;
*) # Default action
    # Commands for all other values
    ;;
esac

# Example 3: Checking Car Brands
read -p "Enter the name of your car brand: " car

case "$car" in
"Tesla")
    echo "${car}'s car factory is in the USA."
    ;;
"BMW" | "Mercedes" | "Audi" | "Porsche")
    echo "${car}'s car factory is in Germany."
    ;;
"Toyota" | "Mazda" | "Mitsubishi" | "Subaru")
    echo "${car}'s car factory is in Japan."
    ;;
*)
    echo "I don't know where ${car}'s car factory is."
    ;;
esac

# Example 4: Checking Days of the Week
read -p "Enter the name of a day of the week: " day

case "$day" in
"Monday" | "Tuesday" | "Wednesday" | "Thursday" | "Friday")
    echo "It's a weekday."
    ;;
"Saturday" | "Sunday")
    echo "It's a weekend."
    ;;
*)
    echo "That doesn't seem to be a day of the week."
    ;;
esac
