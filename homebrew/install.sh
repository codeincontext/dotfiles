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
mv ~/.Brewfile ~/Brewfile 2>/dev/null # because bootstrap prepends a dot in the filename
brew bundle --file=~/Brewfile

exit 0
