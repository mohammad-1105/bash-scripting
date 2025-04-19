#!/bin/bash

# Switch Case Statement

# A switch case statement is a conditional statement that allows you to test a value and execute different blocks of code depending on the value of the test.

# The format of switch case statement in bash:

# case expression in
#     pattern1)
#         # code to execute if pattern1 is matched
#         ;;
#     pattern2)
#         # code to execute if pattern2 is matched
#         ;;
#     pattern3)
#         # code to execute if pattern3 is matched
#         ;;
#     *)
#         # code to execute if none of the patterns match
#         ;;
# esac

# NOTE: Don't forget to add esac at the end of switch case statement

# A Quick example

# Example 1
read -p "Enter a number: " number

case $number in
1)
    echo "You entered 1"
    ;;
2)
    echo "You entered 2"
    ;;
3)
    echo "You entered 3"
    ;;
*)
    echo "You entered ${number}"
    ;;
esac

# The Basic Blueprint:

# It all starts with case: This keyword is like saying, "Okay, Bash, let's check some scenarios!"

# Right after case, you tell it what to look at: You put a variable (like a name or a number) or even a small calculation, followed by the word in. It's like saying, "We're going to look in these different cases for a match with this..."

# Then come the "what ifs" (the patterns):

# You list out the different things you want to compare against.
# Each pattern ends with a closing parenthesis ). It's like saying, "If what we're looking at matches this pattern)..."
# You can even list multiple patterns for the same action, separated by a pipe |. Think of | as "OR." So, "If it matches this OR that)..."
# What to do if there's a match: Right after the ), you write the commands you want Bash to run if the pattern matches what you specified after case in.

# Don't forget the ;; (double semicolon): This is super important! It acts like a "stop sign" at the end of each case's commands. It tells Bash, "Okay, I'm done with this case; don't check any more."

# The "catch-all" with *: You can have a default action if none of the other patterns match. You do this by using an asterisk * as the pattern. It's like saying, "If nothing else matched, then do this..."

# Ending with esac: Just like if ends with fi, the case statement ends with esac (which is just case spelled backward). It tells Bash, "Alright, we're done with all the cases."

# Example 2
case the_thing_we_are_checking in
pattern_one)
    # Do these commands if the_thing_we_are_checking matches pattern_one
    ;;
pattern_two | another_pattern)
    # Do these commands if it matches pattern_two OR another_pattern
    ;;
*) # The default case (like 'else' in if-elif-else)
    # Do these commands if none of the above patterns matched
    ;;
esac

# Example 3
read -p "Enter the name of your car brand: " car
case $car in
Tesla)
    echo -n "${car}'s car factory is in the USA."
    ;;
BMW | Mercedes | Audi | Porsche)
    echo -n "${car}'s car factory is in Germany."
    ;;
Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "${car}'s car factory is in Japan."
    ;;
*)
    echo -n "I don't know where ${car}'s car factory is."
    ;;
esac

# Example 4
read -p "Enter the days of the week: " day

case $day in
Monday | Tuesday | Wednesday | Thursday | Friday)
    echo -n "It's a weekday."
    ;;
Saturday | Sunday)
    echo -n "It's a weekend."
    ;;
*)
    echo -n "It's not a weekday or a weekend."
    ;;
esac


