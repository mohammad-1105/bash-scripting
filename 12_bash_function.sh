#!/bin/bash

# Organizing Your Code with Functions in Bash

# Just like in other programming languages, functions in Bash are a way to group
# a set of commands together under a single name. This helps you organize your
# code, make it more readable, and reuse blocks of code without having to
# write them out repeatedly.

# Defining a Function in Bash (Syntax 1: Using the 'function' keyword):

function greet() {
    echo "Hello $1" # '$1' represents the first argument passed to the function.
}

# Calling (executing) the function:
greet "Aman" # Output: Hello Aman

# Important Note: When calling a function in Bash, you simply use its name
# followed by any arguments, without parentheses '()' as you might see in some
# other programming languages.

# Defining a Function in Bash (Syntax 2: Without the 'function' keyword):

greet2() {
    echo "Hello $1"
}

# Calling the second function:
greet2 "Sakir" # Output: Hello Sakir

# Important Note on Function Definition Style:
# While both syntaxes for defining functions are valid in Bash, using the
# 'function' keyword (the first syntax) is generally considered better for
# readability, especially in longer scripts. It clearly marks the beginning
# of a function definition.

# Passing Arguments to Functions:

# As you saw in the examples, you can pass information (arguments) to your
# functions when you call them. Inside the function, these arguments are
# accessed using special variables:
# - $1: The first argument
# - $2: The second argument
# - $3: The third argument
# - And so on...
# - $@: All arguments passed to the function

# Example with Multiple Arguments:

function introduce() {
    echo "My name is $1 and I am $2 years old."
}

introduce "Charlie" 30 # Output: My name is Charlie and I am 30 years old.

# Local Variables in Functions:

# By default, variables declared inside a function are global, meaning they can
# be accessed outside the function as well. If you want a variable to be
# specific to the function (local), you need to declare it using the 'local' keyword.

function show_info() {
    local my_local_var="This is inside the function"
    global_var="This can be accessed outside"
    echo "${my_local_var}"
}

show_info            # Output: This is inside the function
echo "${global_var}" # Output: This can be accessed outside
# echo "${my_local_var}" # This would result in an empty output or an error
# because 'my_local_var' is local to the 'show_info' function.

# Returning Values from Functions:

# Bash functions don't have a direct 'return' statement like some other languages
# for returning arbitrary values. However, they can "return" a status code (an
# integer between 0 and 255) using the 'return' command. This is typically used
# to indicate success (0) or failure (non-zero).

# To pass data out of a function, you can:
# 1. Use global variables (though this is often discouraged for clarity).
# 2. Have the function print the output, and then capture that output using
#    command substitution ($(function_name)).

function get_greeting() {
    local name="$1"
    echo "Hello, ${name}!"
}

message=$(get_greeting "Alice")
echo "${message}" # Output: Hello, Alice!

# Conclusion for Now:

# This gives you a good introduction to functions in Bash. They are a fundamental
# building block for writing more complex and organized scripts. As mentioned,
# we will be using functions extensively in the upcoming chapters to make our
# scripts more modular and reusable.
