#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile

## Reminder : Add remote upstream branch, fetch and rebase upstream
#git remote add upstream https://github.com/mathiasbynens/dotfiles.git
#git fetch upstream
#git log master..upstream/master
#git diff master upstream/master
#git rebase upstream/master 
