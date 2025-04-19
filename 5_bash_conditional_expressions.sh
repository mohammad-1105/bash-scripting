#!/bin/bash

# Okay, so in the world of coding, you've got these things called conditional statements (and their buddies, expressions and constructs). Basically, they let your program make decisions – do one thing if something is true, and something else if it's false. Think of it like a "choose your own adventure" for your code!

# Now, in Bash, we use these "conditional expressions" mostly with the [[ command (it's a cool one!) and the older [ command. They help us check stuff like whether a file exists, or if one number is bigger than another, or if two pieces of text are the same.

# Here's a handy list of the most common conditional expressions in Bash. Don't sweat trying to remember them all right now! Just bookmark this, and you can always peek back at it whenever you need to do some conditional magic in your scripts. 😉

# File Checks - Finding Out About Files

# Does a file exist at all?
[[ -e "${file}" ]]  # Like asking: "Hey, is there something named '${file}' here?" (True if yes)

# Is it a special kind of file called a 'block device'? (Usually for hard drives, etc.)
[[ -b "${file}" ]]  # "Is '${file}' a block device?" (True if yes)

# Is it another special kind of file called a 'character device'? (Often for things like keyboards)
[[ -c "${file}" ]]  # "Is '${file}' a character device?" (True if yes)

# Is it a folder (also called a directory)?
[[ -d "${file}" ]]  # "Is '${file}' a folder?" (True if yes)

# (Same as the first one) Does a file exist?
[[ -e "${file}" ]]  # "Is '${file}' here?" (True if yes)

# Is it a normal file, like a text file or a program?
[[ -f "${file}" ]]  # "Is '${file}' a regular file?" (True if yes)

# Is it a special kind of shortcut to another file or folder (like an alias)?
[[ -L "${file}" ]]  # "Is '${file}' a shortcut?" (True if yes)

# Can you read what's inside this file?
[[ -r "${file}" ]]  # "Can I read '${file}'?" (True if yes)

# Is the file not empty (does it have something in it)?
[[ -s "${file}" ]]  # "Is '${file}' bigger than nothing?" (True if yes)

# Can you change or write to this file?
[[ -w "${file}" ]]  # "Can I write to '${file}'?" (True if yes)

# Can you run this file like a program?
[[ -x "${file}" ]]  # "Can I run '${file}'?" (True if yes)

# (Same as before) Is it a shortcut?
[[ -L "${file}" ]]  # "Is '${file}' a shortcut?" (True if yes)

# Is it empty?
[[ -z ${var} ]] # Is ${var} empty?