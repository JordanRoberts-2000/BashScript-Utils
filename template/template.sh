case "$1" in
    react)
        source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/template/features/react/react.sh"
        #check if source exists???
        addReactTemplate
        ;;
    help)
        echo "help!!!"
        ;;
    *)
        echo "no command found"
esac