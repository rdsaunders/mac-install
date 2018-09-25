# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check everything is ok with homebrew
brew doctor

brew cask install visual-studio-code

# Install visual studio code extensions
echo "Installing Visual Studio Extensions..."
code --install-extension bierner.markdown-preview-github-styles
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension file-icons.file-icons
code --install-extension mdickin.markdown-shortcuts
code --install-extension wayou.vscode-todo-highlight
