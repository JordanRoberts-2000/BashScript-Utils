#!/bin/bash

title(){
    printf "\033c"
    cat << EOF
=====================================
= Strawr Terminal Utilities         =
=====================================
EOF
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
                echo "You selected Option 3"
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