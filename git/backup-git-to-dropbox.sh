#!/bin/sh
# Original script by Eli Delventhal, edited by skattyadz
# Creates a bare git remote in dropbox for each project given.
# Only useful for backup-type applications. If you need sync/collaboration use https://github.com/anishathalye/git-remote-dropbox instead

# Not enough parameters, show help.
if [ $# -lt 1 ] ; then

cat<<HELP
dropbox-git-remote -- Takes a project folder and creates a Git repository for it on Dropbox

USAGE:
    ./dropbox-git-remote.sh file1 file2 ..

EXAMPLES:
    ./dropbox-git-remote.sh path/to/MyProjectDir
        Creates a git project called MyProjectDir on Dropbox

    ./dropbox-git-remote.sh path/to/workspace/*
        Creates a git project on Dropbox for every folder contained within the workspace directory, where the project name matches the folder name

HELP
    exit 0
fi

START_DIR=$(pwd)

if [ -d ~/Dropbox ] ; then
    if [ ! -d ~/Dropbox/Repos ] ; then
        mkdir ~/Dropbox/Repos
        echo "Dropbox Repos directory created."
    fi
else
    echo "You do not have a Dropbox folder at ~/Dropbox! Install Dropbox. Aborting..."
    exit 0
fi

echo "Starting processing for all files..."
for PROJ in $*
do
    if [ -d $PROJ ] ; then
        PROJNAME=$(basename $PROJ)
        echo "  Processing $PROJNAME..."

        REPO_PATH=~/Dropbox/Repos/$PROJNAME.git

        cd $PROJ
        if [ -d .git ] ; then
            if [ -d REPO_PATH ] ; then
                echo "    $PROJNAME repo already exists. Just pushing"
                # Assume remote is already connected
                git push -q --all dropbox
            else
                echo "    Creating Dropbox remote for $PROJNAME"
                git init --bare -q REPO_PATH
                git remote add dropbox REPO_PATH
                git push -q --all dropbox
            fi
        else
            echo "    Not a git repo: $PROJNAME"
        fi
    fi
done

echo "Done processing all files."
cd $START_DIR

# in future
# git clone -o dropbox ~/Dropbox/git/new-project.git
