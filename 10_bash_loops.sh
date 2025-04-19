#!bin/bash

# As with any other language, loops are very convenient. With Bash you can use for loops, while loops, and until loops

# For Loop Structure

# for item in ${variable}; do
#     echo $item
# done

# NOTE: Don't forget to add done at the end of for loop

# Example 1 of [ For Loop ]
for item in 1 2 3 4 5; do
    echo ${item}
done

# What if we have lot's of numbers
# Example 2 of [ For Loop ]
for num in {1..1000}; do
    echo ${num}
done

# Example 3 of [ For Loop ]
users="aman sakir hussain"
for user in ${users}; do
    echo "${user}"
done
# The output will be
# aman
# sakir
# hussain

# becuase we add spaces between each user so it will print them one by one

# Example 4 of [ For Loop ]
fruits=("apple" "banana" "orange" "mango" "pineapple")
for fruit in ${fruits[@]}; do
    echo "The fruit is ${fruit}"
    if [[ "${fruit}" == "apple" ]]; then
        echo "Eat one apple a day keeps the doctor away"
    fi
done

# While Loop Structure

# while [[ condition ]]; do
#     echo "This will run until the condition is false"
# done

# Example 1 of [ While Loop ]
count=1
while [[ count -le 10 ]]; do
    echo "${count}"
    ((count++))
done

# Another syntax for Example 1 of [ While Loop ]
count=1
while ((count <= 10)); do
    echo "${count}"
    ((count++))
done

# NOTE: we use '<=' in another example and without spaces inside parenthesis but if you do ((count -le 10)) it will not work and you will get an syntax error

# Example 2 of [ While Loop ]
while true; do
    read -p "Enter your name (at least 3 characters): " name

    if [[ -n "${name}" ]] && [[ "${#name}" -ge 3 ]]; then
        echo "Welcome, ${name}!"
        break # Exit the loop if the name is valid
    elif [[ -z "${name}" ]]; then
        echo "Your name can't be empty. Please try again."
    else
        echo "Name must be at least 3 characters long. Please try again."
    fi
done

# Until Loop Structure

# until [[ condition ]]; do
#     echo "This will run until the condition is true"
# done

# Example 1 of [ Until Loop ]
count=1
until ((count > 10)); do
    echo "${count}"
    ((count++))
done

# Example 2 of [ Until Loop ]
read -p "Enter your name (at least 3 characters): " name

until [[ -n "${name}" ]] && [[ "${#name}" -ge 3 ]]; do
    echo "Your name can't be empty. Please try again."
    read -p "Enter your name (at least 3 characters): " name
done

echo "Welcome, ${name}!"

# Continue and Break with Loop
# Example 1
heros=("Spiderman" "Ironman" "Hulk" "Thor" "Batman")

for hero in ${heros[@]}; do
    if [[ "${hero}" == "Ironman" ]]; then
        echo "I am a fan of ${hero}"
        continue
    fi

    echo ${hero}

done

# Example 2
heros=("Spiderman" "Ironman" "Hulk" "Thor" "Batman")

for hero in ${heros[@]}; do
    if [[ "${hero}" == "Ironman" ]]; then
        echo "I am a fan of ${hero}"
        break
    fi

    echo ${hero}

done

# Example 3
for ((i = 0; i <= 10; i++)); do
    echo "Outer Loop $i"
    for ((j = 0; j <= 20; j++)); do
        echo "Inner Loop $j"
        if ((j == 10)); then
            echo "Breaking out of inner loop"
            break 2
        fi
    done
done

# NOTE: We have added 2 to break out of both loops because we have nested loops. It works if we add only 'break' but it will only break out of the inner loop
