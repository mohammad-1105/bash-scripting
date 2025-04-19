#!/bin/bash

# Welcome to the Bash Variables

# As in any other programming language, you can use variables in Bash Scripting as well. However, there are no data types, and a variable in Bash can contain numbers as well as characters.

# To assign a value to a variable, all you need to do is use the = sign:
name="Mohammad"
# NOTE: you can not have spaces before and after the = sign.
# After that, to access the variable, you have to use the $ and reference it as shown below:
echo $name
# Wrapping the variable name between curly brackets is not required, but is considered a good practice, and I would advise you to use them whenever you can:
echo ${name}
# The above code would output: Mohammad as this is the value of our name variable.

# One Thing : You can use your any favourite code editor.

# Now we will append name with some initial content
echo "Hello ${name}. How are you ?"
# or 

another_name="Sakir"
grettings="Welcome"
echo "${grettings} ${another_name}. Where is your friend ${name} ?"


# NOTE: Note that you don't necessarily need to add semicolon ; at the end of each line. It works both ways, a bit like other programming language such as JavaScript!
