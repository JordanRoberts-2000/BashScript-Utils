pressEnterToContinue(){
    title
    echo $1
    read -p "Press Enter to continue"
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

createProject(){
    while true; do
        title
        echo enter name:
        read NEW_TEMP_NAME
        VALID_INPUT_REGEX="^[a-zA-Z0-9&-_]+$"
        if [[ -n "$NEW_TEMP_NAME" && "$NEW_TEMP_NAME" =~ $VALID_INPUT_REGEX ]]; then
            # Check if the directory doesn't already exist
            if [ ! -d "$1/$NEW_TEMP_NAME" ]; then
                mkdir "$1/$NEW_TEMP_NAME"
                openVscode "$1/$NEW_TEMP_NAME"
                break
            else
                echo "Error: Directory '$NEW_TEMP_NAME' already exists at '$1'"
            fi
        else
            echo "Error: Invalid input. Please enter only letters, numbers, -, or & and ensure it is not empty."
        fi
    done
    break 2
}

selectDirsFromPath(){
    if [ -d "$1" ]; then
        directories=($(find "$1" -maxdepth 1 -mindepth 1 -type d))
        directories=("${directories[@]#./}")
        if [ ! ${#directories[@]} -eq 0 ]; then
            directories+=("Back")
            while true; do
                title
                PS3="Select an option (1-${#directories[@]}): "
                select option in "${directories[@]##*/}"; do
                    if [ -n "$option" ]; then
                        if [ "$option" == "Back" ]; then
                            break 2
                        else
                            openVscode "$1/$option"
                            break 4
                        fi
                    else
                        break
                    fi
                done
            done
        else
            pressEnterToContinue "Currently no directories"
        fi
    else
        echo Error: Temp directory path invalid
        exit
    fi
    break
}