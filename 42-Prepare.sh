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
    echo -e "${MAGENTA}2) Exam 03$DUCK${RESET}"
    echo -e "${CYAN}3) Exam 04$DUCK${RESET}"
    echo -e "${GREEN}4) Exam 05$DUCK${RESET}"
    echo -e "${RED}5) Exam 06$DUCK${RESET}"
    read -p "Enter your choice: " exam_choice

    case $exam_choice in
        1) pick_random_exercise "Exam 02" ;;
        2|3|4|5) pick_random_exercise "Exam 0$exam_choice" ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ; sleep 2; display_common_core_menu ;;
    esac
}

# Function to pick a random exercise
pick_random_exercise() {
    exam_folder="exams/common_core/$1"
    if [ -d "$exam_folder" ]; then
        exercise=$(ls "$exam_folder" | shuf -n 1)
        level="1"

        # For Exam 02, assign levels based on the exercise number
        if [ "$1" == "Exam 02" ]; then
            echo -e "${GREEN}=====================================${RESET}"
            echo -e "${YELLOW}You have been assigned: ${MAGENTA}$exercise${RESET}"
            echo -e "${CYAN}Level $level. Please complete it in the rendu/ directory.${RESET}"
            echo -e "${GREEN}=====================================${RESET}"

            # Wait for the user to finish the level before advancing to next levels
            read -p "Press Enter to complete Level 1 and advance to Level 2..." && level="2"
            echo -e "${GREEN}=====================================${RESET}"
            echo -e "${YELLOW}You are now at Level $level. Keep going!${RESET}"
            read -p "Press Enter to complete Level 2 and advance to Level 3..." && level="3"
            echo -e "${GREEN}=====================================${RESET}"
            echo -e "${YELLOW}You are now at Level $level. Almost there!${RESET}"
            read -p "Press Enter to complete Level 3 and advance to Level 4..." && level="4"
            echo -e "${GREEN}=====================================${RESET}"
            echo -e "${YELLOW}Congratulations! You have reached Level $level. Final push!${RESET}"
        else
            echo -e "${GREEN}=====================================${RESET}"
            echo -e "${YELLOW}You have been assigned: ${MAGENTA}$exercise${RESET}"
            echo -e "${CYAN}Please complete it in the rendu/ directory.${RESET}"
            echo -e "${GREEN}=====================================${RESET}"
        fi
    else
        echo -e "${RED}No exercises available for $1. Please try again later.${RESET}"
    fi
}

# Start the script
display_main_menu
