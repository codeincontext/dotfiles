dotfiles
========

Just my dotfiles

Bare git repo approach inspired by [skx/dotfiles](https://github.com/skx/dotfiles) and [this Atlassian post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)


Setup
--------------------

This repository should be cloned/used as a "bare" repository, which lets you track files outside the git folder (in the home directory in this case)

Step one: Clone as bare repo

     git clone --bare git@github.com:skattyadz/dotfiles.git ~/dotfiles.git

Step two: Set up an alias

     alias dotfiles="git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"

Step three: Tell git to ignore untracked files

     dotfiles --local status.showUntrackedFiles no

Step three: See which files will be over-written in your current home directory:

     dotfiles status -s -uno

Step four: When you're happy to replace them, do the necessary:

     dotfiles checkout -b original_files -f
     dotfiles commit -a -m 'original files'
     dotfiles checkout master
