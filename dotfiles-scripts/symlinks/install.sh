# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store.

echo "› sudo softwareupdate -i -a"
# sudo softwareupdate -i -a


# Your desktop is a mess. You never tidy your downloads folder. You use Dropbox but files still creep into your documents folder.
# Maybe you need the *Adz Mac Folder Structure*

# 1. No more Documents folder, use Dropbox instead. A symlink allows program compatability
# 2. The desktop is an antipattern. The downloads folder is already enough of a dumping ground. Let's merge them with a symlink and hide the desktop


if ! [ -L ~/Documents ]
then
  echo "The read prompts in osx/install.sh don't work inside script/install. For now, run osx/install directly"

  read -p "- Do you want to link ~/Documents and ~/Dropbox? (see osx/install) y/n" -n 1 -r
  echo    # (optional) move to a new line

  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "› Linking ~/Documents and ~/Dropbox..."
    mv ~/Documents/* ~/Dropbox
    sudo rm -rf ~/Documents
    ln -s ~/Dropbox ~/Documents
  fi
fi

if ! [ -L ~/Desktop ]
then
  echo "The read prompts in osx/install.sh don't work inside script/install. For now, run osx/install directly"
  read -p "- Do you want to nuke the desktop and link to ~/Downloads? (see osx/install) y/n" -n 1 -r
  echo    # (optional) move to a new line

  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "› Linking ~/Desktop and ~/Downloads"

    mv ~/Desktop/* ~/Downloads
    sudo rm -rf ~/Desktop
    ln -s ~/Downloads ~/Desktop
    defaults write com.apple.finder CreateDesktop false;
  fi
fi
