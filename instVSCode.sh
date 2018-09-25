# Install visual studio code extensions
VSEXT=(
    bierner.markdown-preview-github-styles
    DavidAnson.vscode-markdownlint
    file-icons.file-icons
    mdickin.markdown-shortcuts
    wayou.vscode-todo-highlight
}

echo "Installing Visual Studio Extensions..."
code --install-extension ${VSEXT[@]}
