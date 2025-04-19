#!/bin/bash

# Welcome to the World of Bash Variables!

# Just like in other programming languages you might know, Bash lets you use
# variables to store information. The cool thing about Bash is that you don't
# have to say what *type* of information a variable will hold. A single
# variable can store both numbers and letters.

# How to Give a Value to a Variable:
# To store something in a variable, you just write the variable's name followed
# by an equals sign (=) and then the value you want to store:
my_name="Sakir"
age=20
city="Wonderland"

# IMPORTANT: Make sure there are NO spaces before or after the equals sign (=).
# 'name = "John"' or '"Jane" = person' will cause errors. It should be:
# 'name="John"' and 'person="Jane"'.

# How to See What's Inside a Variable:
# To use the value stored in a variable, you put a dollar sign ($) in front of
# the variable's name:
echo $my_name # This will show "Alice" on the screen.

# Using Curly Braces with Variables:
# Sometimes, you'll see the variable name wrapped in curly braces, like this:
echo ${my_name} # This also shows "Alice".

# It's not always needed for simple variable names, but using curly braces is
# often considered a good habit, especially when:
# 1. The variable name is followed immediately by other letters or numbers.
#    For example, if you wanted to say "mynameis...", you'd use ${my_name}is.
#    Without the braces, Bash might think you're trying to use a variable named
#    'my_nameis' which probably doesn't exist.
# 2. It makes your code clearer to read, especially for more complex variable
#    names.

# So, while 'echo $my_name' works, I recommend getting into the habit of using
# 'echo ${my_name}' whenever you can.

# You Can Use Your Favorite Text Editor:
# When writing Bash scripts, you can use any text editor you like, such as VS Code,
# Sublime Text, Notepad++, or even simple editors like nano or vim in the terminal.

# Let's Combine Variables with Text:
# You can easily mix variables with regular text using 'echo':
greeting="Hello"
person="Bob"
echo "${greeting} ${person}. How's your day going?"
# This will output: "Hello Bob. How's your day going?"

place="Sunnyville"
question="What's the weather like in"
echo "${question} ${place}?"
# This will output: "What's the weather like in Sunnyville?"

friend_name="Charlie"
echo "${greeting} ${person}. Have you seen ${friend_name}?"
# This will output: "Hello Bob. Have you seen Charlie?"

# A Little Note About Semicolons:
# You might have noticed that we don't usually put a semicolon (;) at the end of
# each line in Bash, unlike some other languages like JavaScript or C++. While
# Bash does recognize a semicolon as a command separator (allowing you to put
# multiple commands on one line), it's generally not required at the end of a
# line when each command is on its own line. It works fine without them, making
# the code cleaner and easier to read for most people.
