# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check everything is ok with homebrew
brew doctor

brew cask install visual-studio-code

# Install visual studio code extensions
VSEXT=(
    bierner.markdown-preview-github-styles
    DavidAnson.vscode-markdownlint
    file-icons.file-icons
    mdickin.markdown-shortcuts
    wayou.vscode-todo-highlight
)

echo "Installing Visual Studio Extensions..."
code --install-extension ${VSEXT[@]}
