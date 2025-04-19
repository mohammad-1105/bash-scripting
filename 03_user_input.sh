#!/bin/bash

# Before we were working with just print by writing code ourselves. Now it's time to take the input from the user.

# To take input we use `read` command. And with adding -p flag in read command you don't need to write echo multiple time to print. let's see the example

read -p "What is your name ? " name # <-- here name is a variable
echo "Hi there, ${name}"
echo "Welcome to the bash scripting world."

# It's easy so you don't have to know more examples. So try it yourself.
