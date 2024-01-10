case "$1" in
    tailwind | tw)
        source "/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/add/features/tailwind/tailwind.sh"
        #check if source exists???
        addTailwind
        ;;
    help)
        echo "help!!!"
        ;;
    *)
        echo "no command found"
esac