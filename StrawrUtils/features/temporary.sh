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