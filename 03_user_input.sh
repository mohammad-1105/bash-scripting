#!/bin/bash

# Taking Input from the User with the 'read' Command

# In the previous examples, we've been displaying text that we've directly
# written in the script. Now, let's learn how to make our scripts more
# interactive by asking the user for input.

# The 'read' command is your go-to tool for getting information from the user
# who is running the script. The `-p` flag (which stands for "prompt") allows
# you to display a message to the user directly within the 'read' command,
# so you don't need a separate 'echo' command beforehand. Let's see it in action:

read -p "What is your name? " user_name # <-- 'user_name' is the variable where
#     the user's input will be stored.

echo "Hi there, ${user_name}!"
echo "Welcome to the bash scripting world."

# Explanation of the 'read' command with '-p':
# - 'read': This is the Bash built-in command that waits for the user to type
#   something in the terminal and press the Enter key.
# - '-p "What is your name? "': The '-p' option is followed by the prompt message
#   enclosed in double quotes. This message will be displayed to the user, asking
#   for their input.
# - 'user_name': This is the name of the variable that will store whatever the
#   user types. After the user presses Enter, their input will be assigned to
#   this variable.

# Example Walkthrough:
# 1. When you run this script, you'll see the prompt: "What is your name? "
# 2. The script will pause and wait for you to type your name and press Enter.
# 3. Let's say you type "Alice" and press Enter.
# 4. The value "Alice" will be stored in the 'user_name' variable.
# 5. The script will then execute the following 'echo' commands, and you'll see:
#    Hi there, Alice!
#    Welcome to the bash scripting world.

# It's indeed quite straightforward! You can use the 'read -p' command to ask the
# user for various types of input, such as numbers, choices, or any other
# information your script needs to work.

# Try it Yourself:
# Now that you've seen a basic example, try creating your own scripts that take
# input from the user. For instance, you could ask for their favorite color,
# their age, or the name of a file they want to process. Experiment with different
# prompts and see how the 'read -p' command makes your scripts interactive!
