#!/bin/bash

title(){
    printf "\033c"
    cat << EOF
=====================================
= Strawr Terminal Utilities         =
=====================================
EOF
}

openVscode(){
    if command -v code &> /dev/null; then
        if [ -d "$1" ]; then
            code "$1"
        else
            echo "SRC ERROR: path to vscode doesn't exist"
            exit
        fi
    else
        echo "Vscode needs to be added to path"
        exit
    fi
}

mainMenu(){
    OPTIONS=("Open" "Create" "Playground" "temporary")
    PS3="Select an option (1-${#OPTIONS[@]}): "
    select option in "${OPTIONS[@]}"; do
        case $REPLY in
            1)
                echo "You selected Option 1"
                break
            ;;
            2)
                echo "You selected Option 2"
                break
            ;;
            3)
                PLAYGROUND_PATH="/Users/jordanroberts/Documents/dev/Playground"
                openVscode $PLAYGROUND_PATH
                break
            ;;
            4)
                echo "Exiting the script."
                exit
            ;;
            *)
                echo "Invalid choice. Please try again."
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