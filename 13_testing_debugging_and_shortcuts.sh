#!/bin/bash

# Handling Errors Gracefully in Bash: Exit Codes and Trapping

# When your Bash scripts run, things don't always go according to plan. Errors
# can occur due to various reasons: files not found, incorrect user input,
# failed commands, and so on. It's crucial to handle these errors gracefully to
# prevent your scripts from crashing unexpectedly and to provide informative
# feedback to the user or other parts of the system.

# Exit Codes: The Silent Messengers

# As we briefly touched upon earlier, every command in Bash (including your
# scripts) returns an "exit code" when it finishes. This is a numerical value
# that signals whether the command was successful or not.

# - A zero (0) exit code typically indicates success.
# - A non-zero exit code (usually between 1 and 255) indicates failure. The
#   specific non-zero value can sometimes provide more details about the type
#   of error.

# You can access the exit code of the last executed command using the special
# Bash variable '$?'.

# Example: Checking the Exit Code of a Command
if ls non_existent_file.txt; then
    echo "The 'ls' command succeeded (which is unexpected)."
else
    echo "The 'ls' command failed with exit code: $?"
fi
# In this example, 'ls' will likely fail because the file doesn't exist, and
# '$?' will hold a non-zero value.

# Setting Exit Codes in Your Scripts: The 'exit' Command

# You can explicitly set the exit code of your Bash script using the 'exit'
# command followed by the desired exit status (an integer between 0 and 255).
# It's a good practice to use non-zero exit codes to signal errors.

# Example: Exiting with an Error Code
if [[ -z "${USERNAME}" ]]; then
    echo "Error: The USERNAME environment variable is not set."
    exit 1 # Exit with a non-zero code to indicate an error.
fi

echo "Welcome, ${USERNAME}!"
exit 0 # Exit with a zero code to indicate success.

# Trapping Signals: Responding to Events

# Bash allows you to "trap" signals, which are asynchronous notifications sent to
# a running process (like your script) by the operating system or other
# processes. Signals can indicate various events, such as the user pressing
# Ctrl+C (SIGINT), a program encountering a fatal error (SIGSEGV), or a child
# process exiting (SIGCHLD).

# The 'trap' command lets you specify actions to be taken when your script
# receives certain signals.

# Syntax of 'trap':
# trap 'commands' signals

# - 'commands': The Bash commands to execute when one of the specified 'signals'
#   is received.
# - 'signals': A list of signal names (e.g., SIGINT, SIGTERM) or signal numbers
#   (e.g., 2 for SIGINT, 15 for SIGTERM). You can also use special "signals"
#   like 'EXIT' (executed when the script exits, regardless of the reason) and
#   'ERR' (executed after a command exits with a non-zero status).

# Common Signals:
# - SIGINT (2): Sent when the user presses Ctrl+C (interrupt).
# - SIGTERM (15): Sent to request a graceful termination of the process.
# - SIGQUIT (3): Sent when the user presses Ctrl+\ (quit).
# - SIGKILL (9): Sent to forcefully terminate the process (cannot be trapped).
# - SIGCHLD (17): Sent when a child process exits.
# - EXIT (0): A special "signal" that is executed when the script exits.
# - ERR: A special "signal" that is executed after a command exits with a
#   non-zero status.

# Example 1: Trapping Ctrl+C (SIGINT)
trap 'echo "Script interrupted!"; exit 130' SIGINT

echo "Running the script..."
sleep 10 # Simulate some work
echo "Script finished (if not interrupted)."

# If you press Ctrl+C while the 'sleep' command is running, the trap will catch
# the SIGINT signal, print "Script interrupted!", and then exit the script with
# an exit code of 130 (a common convention for interrupted scripts).

# Example 2: Trapping Errors (ERR)
trap 'echo "Error occurred at line $LINENO. Exiting."; exit 1' ERR

# A command that might fail:
ls -l non_existent_file.txt

echo "This line might not be reached if the 'ls' command fails."

# If the 'ls' command fails (returns a non-zero exit code), the 'ERR' trap will
# be triggered, print an error message along with the line number where the
# error occurred (using the '$LINENO' variable), and then exit the script.

# Example 3: Cleaning Up on Exit (EXIT)
cleanup() {
    echo "Performing cleanup..."
    rm -f /tmp/my_temp_file
    echo "Cleanup complete."
}

trap cleanup EXIT

echo "Script started."
touch /tmp/my_temp_file
echo "Created a temporary file."
# If the script exits normally or due to an error (that isn't trapped to exit
# immediately), the 'cleanup' function will be executed.

# Best Practices for Error Handling:

# - Always check the exit codes of critical commands using 'if' statements or
#   by using the 'set -e' option (which causes the script to exit immediately
#   if a command fails).
# - Use 'trap' to handle signals that might interrupt your script, allowing for
#   graceful termination and cleanup.
# - Provide informative error messages to the user or in logs.
# - Consider using the 'ERR' trap for automatic error handling after command failures.
# - Implement cleanup routines using the 'EXIT' trap to ensure resources are
#   released properly.

# By implementing proper error handling, you can make your Bash scripts more
# robust, reliable, and user-friendly.
