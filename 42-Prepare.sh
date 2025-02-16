#!/bin/bash

# Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
RESET='\e[0m'

# Emojis
WAVE='🌊'
DUCK='🦆'

# Function to display the main menu
display_main_menu() {
    clear
    echo -e "${CYAN}=====================================${RESET}"
    echo -e "${GREEN}        Welcome to 42-Prepare       ${RESET}"
    echo -e "${CYAN}=====================================${RESET}"
    echo -e "${YELLOW}Pick your exam:${RESET}"
    echo -e "${BLUE}1) Piscine $WAVE${RESET}"
    echo -e "${MAGENTA}2) Common Core $DUCK${RESET}"
    read -p "Enter your choice: " choice

    case $choice in
        1) echo -e "${RED}Piscine exams coming soon!${RESET}" ;;
        2) display_common_core_menu ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ; sleep 2; display_main_menu ;;
    esac
}

# Function to display the Common Core menu
display_common_core_menu() {
    clear
    echo -e "${CYAN}=====================================${RESET}"
    echo -e "${GREEN}        Common Core Exams           ${RESET}"
    echo -e "${CYAN}=====================================${RESET}"
    echo -e "${YELLOW}Pick an exam:${RESET}"
    echo -e "${BLUE}1) Exam 02 $DUCK${RESET}"
    read -p "Enter your choice: " exam_choice

    case $exam_choice in
        1) prepare_exam02 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ; sleep 2; display_common_core_menu ;;
    esac
}

# Function to prepare Exam 02 (second_word exercise)
prepare_exam02() {
    # Define the subject folder paths
    subject_folder="exams/common_core/Exam02/second_word"
    exam_folder="exams/common_core/Exam02"
    
    # Check if exam folder exists and create if not
    if [ ! -d "$exam_folder" ]; then
        mkdir -p "$exam_folder"
    fi

    # Create the subject folder if it does not exist
    if [ ! -d "$subject_folder" ]; then
        mkdir -p "$subject_folder"
    fi

    # Create the subject README file with the details
    cat > "$subject_folder/README.md" <<EOF
Assignment name  : second_word
Expected files   : second_word.c
Allowed functions: write
--------------------------------------------------------------------------------

Write a program that takes a string and displays its second word, followed by a newline.

A word is a section of a string delimited by spaces/tabs or by the start/end of the string.

If the number of parameters is not 1, or if there are no words, simply display a newline.

Examples:

\$> ./second_word "pikachu is cool" | cat -e
is\$

\$> ./second_word "test this if you sigma" | cat -e
this\$

\$> ./second_word "fsilva-p is the best :D" | cat -e
is\$

\$> ./second_word "not even one word" | cat -e
even\$

\$> ./second_word "who needs second words when you have a first word" | cat -e
needs\$

\$> ./second_word "    just some spaces before words   " | cat -e
some\$

\$> ./second_word "42 is the answer to life" | cat -e
is\$

\$> ./second_word "   " | cat -e
\$
EOF

    # Notify the user about the exercise
    echo -e "${GREEN}=====================================${RESET}"
    echo -e "${YELLOW}You have been assigned: second_word${RESET}"
    echo -e "${CYAN}Level 1. You have 3 hours to complete it in the rendu/ directory.${RESET}"
    echo -e "${GREEN}=====================================${RESET}"
    echo -e "${YELLOW}Please create your solution in the rendu/ directory.${RESET}"
    echo -e "${CYAN}=====================================${RESET}"

    # Create rendu directory if it doesn't exist
    mkdir -p rendu

    # Start the countdown timer in the background (but don't display it yet)
    countdown_timer 10800 &  # 3 hours in seconds
    timer_pid=$!  # Store the timer process ID for later use

    # Show the 42-prepare prompt
    show_prompt
}

# Function to countdown time (show time only when requested)
countdown_timer() {
    local duration=$1
    while [ $duration -gt 0 ]; do
        local hours=$((duration / 3600))
        local minutes=$(((duration % 3600) / 60))
        local seconds=$((duration % 60))
        # Show the remaining time only when needed (in the background)
        sleep 1
        ((duration--))
    done
}

# Function to display the 42-prepare prompt and handle user input
show_prompt() {
    while true; do
        echo -n "42-prepare> "
        read command

        # If user enters 'correct me', show the remaining time, simulate correction process
        if [[ "$command" == "correct me" ]]; then
            echo -e "${CYAN}Correcting your solution...${RESET}"
            kill $timer_pid  # Stop the countdown
            sleep 2  # Simulate correcting process
            echo -e "${GREEN}Good job! You got it!${RESET}"
            echo -e "${YELLOW}Press Enter to go to Level 2...${RESET}"
            read  # Wait for Enter to continue to the next level
            break
        fi
        # If the command is invalid, ask again
        echo -e "${RED}Invalid command. Please type 'correct me' to check your solution.${RESET}"
    done
}

# Start the script
display_main_menu
