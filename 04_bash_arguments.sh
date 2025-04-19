#!/bin/bash

# Passing Information to Your Bash Scripts: Arguments

# When you run a Bash script, you have the ability to send it extra bits of
# information right when you execute it. These extra bits are called "arguments"
# or "command-line arguments." They allow you to make your scripts more flexible
# and do different things based on what you provide when you run them.

# How to Provide Arguments:
# To give arguments to a script, you simply type them after the script's name
# when you run it in the terminal. Make sure to separate each argument with a
# space. Here's an example:

# ./my_script.sh apple banana cherry

# In this example, 'apple', 'banana', and 'cherry' are the arguments being
# passed to the script 'my_script.sh'.

# Accessing Arguments Inside Your Script: Special Variables

# Bash provides special variables that you can use inside your script to access
# these arguments:

# - $0: This special variable always holds the name of the script itself,
#   including the path you used to run it (e.g., './my_script.sh' or just
#   'my_script.sh' if it's in your system's PATH).

# - $1: This variable contains the very first argument you typed after the
#   script name (in our example above, $1 would be 'apple').

# - $2: This variable holds the second argument ('banana' in our example).

# - And so on: For any additional arguments, you can use $3 for the third, $4
#   for the fourth, and so on.

# - $@: This special variable represents all the arguments you passed, as a
#   single string. Each argument is separated by spaces within this string. If
#   you used our example './my_script.sh apple banana cherry', then $@ would
#   be the string "apple banana cherry".

# Let's See Some Practical Examples:

echo "Script name: $0"
# If you run './my_script.sh', the output will be:
# Script name: ./my_script.sh
# If you run 'my_script.sh' (and it's in your PATH), the output might be:
# Script name: my_script.sh

echo "First argument: $1"
# If you run './my_script.sh Hello world', the output will be:
# First argument: Hello

echo "Second argument: $2"
# If you run './my_script.sh Hello world', the output will be:
# Second argument: world

echo "All arguments: $@"
# If you run './my_script.sh One Two Three', the output will be:
# All arguments: One Two Three

# A Word of Caution: Self-Deletion with $0

# You included a note about self-deletion using 'rm -f $0'. This is a very
# powerful and potentially dangerous command, so let's discuss it carefully.

# 'rm' is the command in Unix-like systems used to remove files and directories.
# The '-f' option stands for 'force', which means it will attempt to remove the
# specified file(s) without prompting for confirmation, even if the file is
# write-protected.

# '$0' in this context refers to the path of the currently running script.
# Therefore, 'rm -f $0' would attempt to forcefully delete the script file that
# is currently being executed.

# Important Considerations and Best Practices Regarding Self-Deletion:

# 1. Risk of Data Loss: Executing 'rm -f $0' will permanently delete your script
#    file. If there are any errors or unintended consequences in the script
#    before this line is reached, you could lose your work.

# 2. Debugging Difficulties: If a script deletes itself, it becomes much harder
#    to debug or understand what went wrong after it has run.

# 3. Limited Use Cases: Self-deletion is a very rare requirement for most
#    scripts. There are usually better ways to manage the lifecycle of your
#    scripts.

# 4. Potential for Errors: Depending on the permissions and how the script is
#    executed, the script might not even have the necessary permissions to
#    delete itself.

# Best Practice: Avoid Self-Deletion in Most Cases
# It is generally strongly recommended to avoid self-deletion in your Bash
# scripts unless you have a very specific and well-understood reason for doing so,
# and you are absolutely certain of the implications. Always ensure you have
# backups of your scripts and understand the potential risks before implementing
# self-deletion.

# In most scenarios, it's better to manage script files explicitly through other
# means (e.g., using separate commands to remove old versions or uninstall scripts).