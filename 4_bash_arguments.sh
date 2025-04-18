#!/bin/bash

# Passing Arguments to Your Bash Script

# When you run a Bash script, you can provide extra pieces of information after the script's name. These are called arguments.
# To pass an argument, simply type it after the script name, separated by spaces. For example:

# ./your_script.sh first_argument second_argument another_one

# Inside your script, Bash uses special variables to represent these arguments:
# - $0: This special variable holds the name of the script itself (e.g., ./your_script.sh).
# - $1: This variable contains the first argument you passed (e.g., first_argument).
# - $2: This variable contains the second argument (e.g., second_argument).
# - And so on for any additional arguments ($3, $4, etc.).
# - $@: This special variable represents all the arguments you passed, as a single string where each argument is separated by spaces.

# Let's see some examples of how these variables work:

echo "Script name: $0"     # Output: Script name: ./your_script.sh (or just your_script.sh depending on how you run it)
echo "First argument: $1"  # If you run ./your_script.sh Hello world, the output is: First argument: Hello
echo "Second argument: $2" # If you run ./your_script.sh Hello world, the output is: Second argument: world
echo "All arguments: $@"   # If you run ./your_script.sh One Two Three, the output is: All arguments: One Two Three

# NOTE: you can also perform self deletion with $0 it's powerful for example you can do something like this but please make sure you have backup of your scripts

# rm -f $0

# rm = remove
# -f = forcefully
# $0 = current path
