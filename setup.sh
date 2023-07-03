# echo "Creating an SSH key for you..."
# ssh-keygen -t rsa

# echo "Please add this public key to Github \n"
# echo "https://github.com/account/ssh \n"
# read -p "Press [Enter] key after this..."

# echo "Installing xcode-stuff"
# xcode-select --install

# Check for Homebrew,
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/admin/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "Andreas Hoeppener"
git config --global user.email Andreas.hoeppener@pacemaker.ai

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install svn
brew install mackup
brew install node

echo "Installing homebrew cask"
brew install homebrew/cask

apps=(
  bitwarden
  dropbox
  docker
  firefox
  google-chrome
  github
  microsoft-teams
  microsoft-office
  miro
  spotify
  visual-studio-code
  zoom
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}

echo "Cleaning up brew"
brew cleanup

killall Finder

echo "Done!"

#@TODO install vagrant and sites folder
