function set_abbreviations
  abbr -a ga   git add
  abbr -a gap  git add --patch
  abbr -a gai  git add --intent-to-add --all
  abbr -a gc   git commit
  abbr -a gcm  git commit --message
  abbr -a gca  git commit --amend
  abbr -a gco  git checkout
  abbr -a gcob git checkout -b
  abbr -a gcom git checkout master
  abbr -a gco- git checkout -
  abbr -a gb   git branch
  abbr -a gbs  git branch --sort=-committerdate

  abbr -a gs   git status --short
  abbr -a gd   git diff
  abbr -a gds  git diff --staged
  abbr -a gl   git log --pretty=format:\"\%h \%ad \| \%s\%d [\%an]\" --graph --date=short
  abbr -a gg   git grep

  abbr -a gf    git fetch
  abbr -a gpl   git pull
  abbr -a gpoh  git push origin head
  abbr -a gpohf git push origin head -f
  abbr -a grom  git fetch\; git rebase origin/master
  abbr -a grc   git rebase --continue
  abbr -a gri   git rebase --interactive
  abbr -a hpr   git push origin head\; and hub pull-request

  abbr -a .. cd ..
  abbr -a ll ls -ll
end
