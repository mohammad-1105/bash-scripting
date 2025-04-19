#!/bin/bash

# Making Decisions in Your Bash Scripts: Conditional Expressions

# Just like in real life, sometimes your scripts need to make choices. They need
# to do one thing if a certain condition is true, and maybe something else if
# that condition is false. These "conditions" are like questions that Bash can
# answer with "yes" (true) or "no" (false).

# In Bash, we often use these conditions with the '[[ ... ]]' command (which is
# quite powerful) and the older '[ ... ]' command. They help us check various
# things, like:
# - Does a specific file exist?
# - Is a number bigger than another number?
# - Are two pieces of text exactly the same?

# Here's a list of some common "conditional expressions" you'll use in Bash.
# Don't worry about memorizing them all right now. Think of this as a reference
# you can come back to whenever your script needs to make a decision!

# Checking Things About Files (File Expressions):

# Does a file exist?
[[ -e "${file}" ]] # True if a file or directory named '${file}' exists.
# Think of it as asking: "Does '${file}' exist?"

# Is it a special file representing a block device?
[[ -b "${file}" ]] # True if '${file}' exists AND it's a block device
# (like a hard drive partition).

# Is it a special file representing a character device?
[[ -c "${file}" ]] # True if '${file}' exists AND it's a character device
# (like a keyboard or a terminal).

# Is it a directory (a folder)?
[[ -d "${file}" ]] # True if '${file}' exists AND it's a directory.
# Asking: "Is '${file}' a folder?"

# (Again) Does a file exist?
[[ -e "${file}" ]] # Just a reminder, this checks for any kind of file or directory.

# Is it a regular file?
[[ -f "${file}" ]] # True if '${file}' exists AND it's a normal file (like a
# text file, script, or program).

# Is it a symbolic link (a shortcut to another file or directory)?
[[ -L "${file}" ]] # True if '${file}' exists AND it's a symbolic link.
# Asking: "Is '${file}' a shortcut?"

# Can the script read the contents of this file?
[[ -r "${file}" ]] # True if '${file}' exists AND the script has permission to
# read it. Asking: "Can I read '${file}'?"

# Is the file not empty?
[[ -s "${file}" ]] # True if '${file}' exists AND its size is greater than zero
# bytes (meaning it contains something).
# Asking: "Is '${file}' not empty?"

# Can the script change or write to this file?
[[ -w "${file}" ]] # True if '${file}' exists AND the script has permission to
# write to it. Asking: "Can I write to '${file}'?"

# Can the script execute this file (run it as a program)?
[[ -x "${file}" ]] # True if '${file}' exists AND the script has permission to
# execute it. Asking: "Can I run '${file}'?"

# (Again) Is it a shortcut?
[[ -L "${file}" ]] # Just a reminder about checking for symbolic links.

# Checking if a Variable is Empty:
[[ -z "${variable_name}" ]] # True if the variable named 'variable_name' has
# a length of zero (it's empty).
# Asking: "Is '${variable_name}' empty?"
