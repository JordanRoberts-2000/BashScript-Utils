#add back out of create
#error handling
TEMP_FOLDER_PATH=/Users/jordanroberts/Documents/temp

openTempEnv(){
    if [ -d "$TEMP_FOLDER_PATH" ]; then
        directories=("$TEMP_FOLDER_PATH"/*)
        # Filter only directories
        directories=("${directories[@]%/}")
        projects=("${directories[@]%/}")
        if [ ! ${#projects[@]} -eq 0 ]; then
            title
            PS3="Select an option (1-${#projects[@]}): "
            select directory in "${directories[@]##*/}"; do
                if [ -n "$directory" ]; then
                    openVscode "$TEMP_FOLDER_PATH/$directory"
                    break
                else
                    echo "Invalid choice. Please try again."
                fi
            done
        else
            echo "Currently no directories"
        fi
    else
        echo Error: Temp directory path invalid
    fi
    break 2
}

temporary(){
    while true; do
        TEMPORARY_LIST=("Create" "Delete node_modules" "Open" "Back")
        COLUMNS=0
        PS3="Select an option (1-${#TEMPORARY_LIST[@]}): "
        title
        select option in "${TEMPORARY_LIST[@]}"; do
            case $REPLY in
                1)
                    createProject $TEMP_FOLDER_PATH
                ;;
                2)
                    break 2
                ;;
                3)
                    openTempEnv
                ;;
                4)
                    break 2
                ;;
                *)
                    break
                ;;
            esac
        done
    done
    break
}