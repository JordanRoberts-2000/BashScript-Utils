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
                    while true; do
                        title
                        echo -n "are you sure? (y/n)"
                        read ARE_YOU_SURE
                        if [ "$ARE_YOU_SURE" == "y" ]; then
                            find $TEMP_FOLDER_PATH -name "node_modules" -type d -exec rm -rf {} +
                            break 3
                        fi
                        if [ "$ARE_YOU_SURE" == "n" ]; then
                            break 2
                        fi
                        
                    done
                ;;
                3)
                    selectDirsFromPath $TEMP_FOLDER_PATH
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