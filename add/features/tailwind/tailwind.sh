#flag for css name?
#flag or autodetection for tailwind.config type eg: react, solid, ect

installTailwind(){
    pnpm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
}

addToCss(){
    STYLES_CSS_PATH=$(find "$CURRENT_PATH/src" -type f -name "index.css")
    top_content='@tailwind base;\n@tailwind components;\n@tailwind utilities;'
    # Check if the file was found
    if [ -n "$STYLES_CSS_PATH" ]; then
        echo "styles.css found at $STYLES_CSS_PATH"
        sed -i '' -e "1s/^/$top_content\n\n/" "$STYLES_CSS_PATH"
    else
        echo "styles.css not found within the src folder."
        exit
    fi
}

modifyTailwindConfig(){
    TAILWIND_CONFIG_PATH=/Users/jordanroberts/Documents/dev/Projects/main/StrawrTerminal/add/features/tailwind/tailwindConfig.js
    if [ ! -f "$TAILWIND_CONFIG_PATH" ]; then
        echo "SRC ERROR: tailwind config path not found"
        exit
    fi
    CURRENT_TAILWINDCONFIG=$(find "$CURRENT_PATH" -type f -name "tailwind.config.js" -not -path "$CURRENT_PATH/node_modules/*")
    if [ -n "$CURRENT_TAILWINDCONFIG" ]; then
        echo "tailwind.config.js found"
        cp "$TAILWIND_CONFIG_PATH" "$CURRENT_TAILWINDCONFIG"
    else
        echo "tailwind.config.js not found"
        exit
    fi
}

addTailwind(){
    CURRENT_PATH=$(pwd)
    installTailwind
    modifyTailwindConfig
    addToCss
}