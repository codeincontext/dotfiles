function set_abbreviations
  abbr -a ga   git add
  abbr -a gap  git add --patch
  abbr -a gai  git add --intent-to-add --all
  abbr -a gc   git commit
  abbr -a gcm  git commit --message
  abbr -a gfu  git commit --fixup
  abbr -a gca  git commit --amend
  abbr -a gcan git commit --amend --no-edit
  abbr -a gco  git checkout
  abbr -a gcob git checkout -b
  abbr -a gcom git checkout master
  abbr -a gco- git checkout -
  abbr -a gb   git branch
  abbr -a gbs  git branch --sort=-committerdate
  abbr -a gmt  git mergetool
  abbr -a gcp  git cherry-pick

  abbr -a gs   git status --short --branch
  abbr -a gd   git diff
  abbr -a gds  git diff --staged
  abbr -a gl   git log --pretty=format:\"\%h \%ad \| \%s\%d [\%an]\" --graph --date=short
  abbr -a glh   git log --pretty=format:\"\%h \%ad \| \%s\%d [\%an]\" --graph --date=short \| head
  abbr -a gg   git grep

  abbr -a gf    git fetch
  abbr -a gpl   git pull
  abbr -a gpoh  git push origin head
  abbr -a gpohf git push origin head --force-with-lease
  abbr -a gr    git rebase
  abbr -a grom  git fetch\; git rebase origin/master
  abbr -a grc   git rebase --continue
  abbr -a grs   git rebase --skip
  abbr -a gri   git rebase --interactive
  abbr -a gras  git rebase --interactive --autosquash head~8
  abbr -a hpr   git push origin head\; and hub pull-request

  abbr -a dc    docker-compose
  abbr -a dcu   docker-compose up
  abbr -a dcub  docker-compose up --build
  abbr -a dcr   docker-compose run
  abbr -a dce   docker-compose exec

  abbr -a dotfiles /usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME

  abbr -a .. cd ..
  abbr -a ll ls -ll
end
