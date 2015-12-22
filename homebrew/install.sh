#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log

fi

# Install homebrew packages
brew tap Homebrew/bundle

# think this only does something on second run
mv ~/.Brewfile ~/Brewfile 2>/dev/null # because bootstrap prepends a dot in the filename

# Here because it won't be symlinked on first run
brew bundle --file=homebrew/Brewfile.symlink

exit 0
