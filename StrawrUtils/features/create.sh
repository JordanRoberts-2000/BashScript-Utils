create(){
    while true; do
        TEMPORARY_LIST=("Main" "Side" "Web" "Other" "Back")
        COLUMNS=0
        PS3="Select an option (1-${#TEMPORARY_LIST[@]}): "
        title
        select option in "${TEMPORARY_LIST[@]}"; do
            case $REPLY in
                1)
                    createProject $DEV_FOLDER_PATH/main
                ;;
                2)
                    createProject $DEV_FOLDER_PATH/side
                ;;
                3)
                    createProject $DEV_FOLDER_PATH/web
                ;;
                4)
                    createProject $DEV_FOLDER_PATH/other
                ;;
                5)
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