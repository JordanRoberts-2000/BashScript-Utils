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