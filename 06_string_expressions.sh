#!/bin/bash

# Now let's see how to use string expressions in Bash:

# Imagine you're asking Bash questions about words or sentences (which we call "strings" in programming).

# Here we go:
# Example 1

# [[ -v varname ]] - Is a Variable Set?

# Think of this like asking, "Hey Bash, did I even create a box with this name and put something in it?"

my_name="Sakir"

if [[ -v my_name ]]; then
    echo "Yep, the variable 'my_name' has a value: $my_name"
else
    echo "Nope, the variable 'my_name' hasn't been set yet."
fi

unset my_name # This removes the variable

if [[ -v my_name ]]; then
    echo "Still set? Nope!"
else
    echo "See? Now 'my_name' is not set."
fi

# Key Point: You just use the name of the variable (my_name), not its value ($my_name).

# Example 2
# [[ -z ${string} ]] - Is the String Empty?

# Imagine asking, "Is this text box completely empty?"

empty_text=""
not_empty_text="Hello"

if [[ -z "${empty_text}" ]]; then
    echo "The 'empty_text' variable is empty."
else
    echo "The 'empty_text' variable has something in it: '${empty_text}'"
fi

if [[ -z "${not_empty_text}" ]]; then
    echo "The 'not_empty_text' variable is empty."
else
    echo "The 'not_empty_text' variable has something in it: '${not_empty_text}'"
fi

# Example 3

# [[ -n ${string} ]] - Is the String NOT Empty?
# This is the opposite of -z. It's like asking, "Is there anything at all in this text box?"

some_text="Something here"
blank_text=""

if [[ -n "${some_text}" ]]; then
    echo "The 'some_text' variable is NOT empty: '${some_text}'"
else
    echo "The 'some_text' variable is empty."
fi

if [[ -n "${blank_text}" ]]; then
    echo "The 'blank_text' variable is NOT empty."
else
    echo "The 'blank_text' variable is empty."
fi


# Example 4
# [[ ${string1} == ${string2} ]] - Are the Strings Exactly the Same?

# Think of this as asking, "Do these two pieces of text match perfectly, letter for letter?"

word1="apple"
word2="apple"
word3="orange"

if [[ "${word1}" == "${word2}" ]]; then
  echo "'${word1}' and '${word2}' are the same!"
else
  echo "'${word1}' and '${word2}' are different."
fi

if [[ "${word1}" == "${word3}" ]]; then
  echo "'${word1}' and '${word3}' are the same!"
else
  echo "'${word1}' and '${word3}' are different."
fi

# Example 5
# [[ ${string1} != ${string2} ]] - Are the Strings Different?

# This is the opposite of ==. It's like asking, "Are these two pieces of text NOT an exact match?"

first_name="Alice"
second_name="Bob"

if [[ "${first_name}" != "${second_name}" ]]; then
  echo "'${first_name}' and '${second_name}' are different names."
else
  echo "'${first_name}' and '${second_name}' are the same name."
fi

# Example 6
# [[ ${string1} < ${string2} ]] - Does the First String Come Before the Second (Alphabetically)?

# Imagine putting words in dictionary order.

letter_a="apple"
letter_b="banana"
letter_c="ant"

if [[ "${letter_a}" < "${letter_b}" ]]; then
  echo "'${letter_a}' comes before '${letter_b}' alphabetically."
else
  echo "'${letter_a}' comes after or is the same as '${letter_b}' alphabetically."
fi

if [[ "${letter_c}" < "${letter_a}" ]]; then
  echo "'${letter_c}' comes before '${letter_a}' alphabetically."
else
  echo "'${letter_c}' comes after or is the same as '${letter_a}' alphabetically."
fi

# Important Note: This is alphabetical order, so uppercase and lowercase letters matter! "Apple" comes after "apple".


# Example 7

# [[ ${string1} > ${string2} ]] - Does the First String Come After the Second (Alphabetically)?

# The opposite of <

word_x="zebra"
word_y="yak"

if [[ "${word_x}" > "${word_y}" ]]; then
  echo "'${word_x}' comes after '${word_y}' alphabetically."
else
  echo "'${word_x}' comes before or is the same as '${word_y}' alphabetically."
fi

# NOTE: Remember to always put double quotes around your variables ("${variable}") inside the [[ ]] to avoid unexpected behavior, especially when the variable might contain spaces!
