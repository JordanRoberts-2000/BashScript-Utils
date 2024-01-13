#!/bin/bash

DEV_FOLDER_PATH=/Users/jordanroberts/Documents/dev/Projects
TEMP_FOLDER_PATH="/Users/jordanroberts/Documents/temp"

title(){
    printf "\033c"
    cat << EOF
=====================================
= Strawr Terminal Utilities         =
=====================================
EOF
}

#openVscode
source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/StrawrUtils/utils/utils.sh"

mainMenu(){
    OPTIONS=("Open" "Create" "Playground" "Temporary")
    PS3="Select an option (1-${#OPTIONS[@]}): "
    select option in "${OPTIONS[@]}"; do
        case $REPLY in
            1)
                source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/StrawrUtils/features/open.sh"
                open
            ;;
            2)
                source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/StrawrUtils/features/create.sh"
                create
            ;;
            3)
               source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/StrawrUtils/features/playground.sh"
               playground
            ;;
            4)
                source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/StrawrUtils/features/temporary.sh"
                temporary
            ;;
            *)
                break
            ;;
        esac
    done
}

main(){
    while true; do
        title
        mainMenu
    done
}

main