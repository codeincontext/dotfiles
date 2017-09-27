dotfiles
========

Just my dotfiles

Bare git repo approach inspired by [skx/dotfiles](https://github.com/skx/dotfiles) and [this Atlassian post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)


Cloning dotfiles and the install scripts
--------------------

This repository should be cloned/used as a "bare" repository, which lets git track files in your home directory

Step one: Clone as bare repo

```bash
git clone --bare git@github.com:skattyadz/dotfiles.git ~/dotfiles.git
```

Step two: Set up an alias

```bash
alias dotfiles="git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"
```

Step three: Tell git to ignore untracked files

```bash
dotfiles config --local status.showUntrackedFiles no
```

Step three: See which files will be over-written in your current home directory:

```bash
dotfiles status -s -uno
```

Step four: When you're happy to replace them, do the necessary:

```bash
dotfiles checkout -b original_files -f
dotfiles commit -a -m 'original files'
dotfiles checkout master
```

Now you need to run the install scripts


Pulling from github and running install scripts
--------------------

Do this periodically

```bash
dotfiles pull
cd ~/dotfiles-scripts
./install
```


Adding a file to the repo
--------------------

```bash
dotfiles add ~/path/to/my/file
dotfiles push origin master
```

