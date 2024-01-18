# current dir
# pnpm create vite@latest . --template react-ts
# creates frontend folder
# pnpm create vite@latest frontend --template react-ts
# for when frontend folder is created
# pnpm install --prefix "path"

addReactTemplate(){
    pnpm create vite@latest . --template react-ts
    #add folders
    mkdir "$(pwd)/src/components"
    mkdir "$(pwd)/src/data"
    mkdir "$(pwd)/src/features"
    mkdir "$(pwd)/src/hooks"
    mkdir "$(pwd)/src/layout"
    mkdir "$(pwd)/src/lib"
    mkdir "$(pwd)/src/pages"
    mkdir "$(pwd)/src/utils"
    #remove files
    rm "$(pwd)/src/App.css"
    #replace css content
    css_replacement_content="*{\n\tpadding: 0;\n\tmargin: 0;\n\tbox-sizing: 0;\n}"
    echo -e $css_replacement_content > $(pwd)/src/index.css
    #replace main.tsx content
    CURRENT_APP_PATH="/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/template/features/react/App.txt"
    cp "$CURRENT_APP_PATH" "$(pwd)/src/App.tsx"
    #install dependancies
    pnpm install
}