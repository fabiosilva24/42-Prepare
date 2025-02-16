#!/bin/bash

# Define the expected output for the second word exercise
EXPECTED_OUTPUT="hello"

# Compile the student's code
gcc -Wall -Wextra -Werror second_word.c -o second_word

# Run the student's program with a test input
ACTUAL_OUTPUT=$(./second_word "test hello world")

# Compare the actual output with the expected output
if [ "$ACTUAL_OUTPUT" == "$EXPECTED_OUTPUT" ]; then
    echo -e "\e[32mCorrect! The output is as expected.\e[0m"
else
    echo -e "\e[31mIncorrect. The output was: $ACTUAL_OUTPUT\e[0m"
    echo -e "\e[33mExpected: $EXPECTED_OUTPUT\e[0m"
fi
