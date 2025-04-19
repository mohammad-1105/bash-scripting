#!/bin/bash

# Working with Text: String Expressions in Bash

# In addition to numbers, Bash lets you ask questions about text, which we call
# "strings." These string expressions help your scripts understand and compare
# words, phrases, and other text.

# Let's explore some common string expressions you can use within the '[[ ... ]]'
# command.

# Example 1: Checking if a Variable Has Been Set (`-v`)

# This is like asking Bash, "Does a variable with this name exist and have a
# value assigned to it?"

my_pet="cat"

if [[ -v my_pet ]]; then
  echo "Yes, the variable 'my_pet' is set and its value is: $my_pet"
else
  echo "No, the variable 'my_pet' has not been set yet."
fi

unset my_pet # This command removes the variable 'my_pet'

if [[ -v my_pet ]]; then
  echo "Still set? That's unexpected!"
else
  echo "See? Now 'my_pet' is no longer set."
fi

# Important: When using '-v', you provide the name of the variable itself
# (e.g., 'my_pet'), not its value (e.g., '$my_pet').

# Example 2: Checking if a String is Empty (`-z`)

# This is like asking, "Is this piece of text completely empty, containing no
# characters at all?"

empty_message=""
full_message="Greetings!"

if [[ -z "${empty_message}" ]]; then
  echo "The 'empty_message' variable is empty."
else
  echo "The 'empty_message' variable contains: '${empty_message}'"
fi

if [[ -z "${full_message}" ]]; then
  echo "The 'full_message' variable is empty."
else
  echo "The 'full_message' variable contains: '${full_message}'"
fi

# Example 3: Checking if a String is NOT Empty (`-n`)

# This is the opposite of '-z'. It asks, "Does this piece of text contain at
# least one character?"

some_data="Present"
no_data=""

if [[ -n "${some_data}" ]]; then
  echo "The 'some_data' variable is not empty: '${some_data}'"
else
  echo "The 'some_data' variable is empty."
fi

if [[ -n "${no_data}" ]]; then
  echo "The 'no_data' variable is not empty."
else
  echo "The 'no_data' variable is empty."
fi

# Example 4: Checking if Two Strings are Exactly the Same (`==`)

# This is like asking, "Do these two pieces of text match perfectly, including
# capitalization and spacing?"

word_one="hello"
word_two="hello"
word_three="HELLO"

if [[ "${word_one}" == "${word_two}" ]]; then
  echo "'${word_one}' and '${word_two}' are identical."
else
  echo "'${word_one}' and '${word_two}' are different."
fi

if [[ "${word_one}" == "${word_three}" ]]; then
  echo "'${word_one}' and '${word_three}' are identical."
else
  echo "'${word_one}' and '${word_three}' are different."
fi

# Example 5: Checking if Two Strings are Different (`!=`)

# This is the opposite of '=='. It asks, "Are these two pieces of text NOT an
# exact match?"

first_color="red"
second_color="blue"

if [[ "${first_color}" != "${second_color}" ]]; then
  echo "'${first_color}' and '${second_color}' are different colors."
else
  echo "'${first_color}' and '${second_color}' are the same color."
fi

# Example 6: Checking Alphabetical Order (Less Than `<`)

# This is like asking, "If we were to put these words in a dictionary, would the
# first word come before the second?"

fruit_a="apple"
fruit_b="banana"
fruit_c="ant"

if [[ "${fruit_a}" < "${fruit_b}" ]]; then
  echo "'${fruit_a}' comes before '${fruit_b}' alphabetically."
else
  echo "'${fruit_a}' comes after or is the same as '${fruit_b}' alphabetically."
fi

if [[ "${fruit_c}" < "${fruit_a}" ]]; then
  echo "'${fruit_c}' comes before '${fruit_a}' alphabetically."
else
  echo "'${fruit_c}' comes after or is the same as '${fruit_a}' alphabetically."
fi

# Important: Alphabetical comparison in Bash is case-sensitive. This means
# uppercase letters are considered "smaller" than lowercase letters. For
# example, "Apple" would come before "apple".

# Example 7: Checking Alphabetical Order (Greater Than `>`)

# This is the opposite of '<'. It asks, "Would the first word come after the
# second in a dictionary?"

animal_x="zebra"
animal_y="yak"

if [[ "${animal_x}" > "${animal_y}" ]]; then
  echo "'${animal_x}' comes after '${animal_y}' alphabetically."
else
  echo "'${animal_x}' comes before or is the same as '${animal_y}' alphabetically."
fi

# Best Practice: Always Use Double Quotes Around Variables in '[[]]'
# It's a good habit to always enclose your variables in double quotes (like
# "${variable}") when using them inside the '[[ ... ]]' command. This helps
# prevent unexpected behavior if a variable contains spaces or special characters.
