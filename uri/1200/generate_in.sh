#!/bin/bash

alphabet=($(echo {b..z}))
NUMBER_OF_COMMANDS=80

function print_insertion_command {
    local alphabet_size=${#alphabet[@]}
    local letter_index=$(($RANDOM % $alphabet_size))
    local letter=${alphabet[letter_index]}
    alphabet=(${alphabet[@]/$letter})

    echo "I $letter"
}

function print_search_command {
    local alphabet=($(echo {a..z}))
    local letter_index=$(($RANDOM % 26))
    local letter=${alphabet[letter_index]}

    echo "P $letter"
}

function print_some_traversal_command {
    n=$(($RANDOM % 3))
    if [ $n == 0 ]; then
        echo "PREFIXA"
    elif [ $n == 1 ]; then
        echo "INFIXA"
    else
        echo "POSFIXA"
    fi
}

echo "I a"

for i in $(seq $NUMBER_OF_COMMANDS); do
    n=$(($RANDOM % 3))

    if [ $n == 0 -a ${#alphabet[@]} != 0 ]; then
        print_insertion_command
    elif [ $n == 1 ]; then
        print_search_command
    else
        print_some_traversal_command
    fi
done
