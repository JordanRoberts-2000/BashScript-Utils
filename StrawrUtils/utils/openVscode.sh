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