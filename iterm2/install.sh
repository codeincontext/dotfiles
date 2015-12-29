#!/bin/sh

rm ~/Library/Preferences/com.googlecode.iterm2.plist
ln -s "$(pwd)/iterm2/com.googlecode.iterm2.plist" ~/Library/Preferences
