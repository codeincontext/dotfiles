#!/bin/sh

rm ~/Library/Application\ Support/Karabiner/private.xml
ln -s "$(pwd)/karabiner/private.xml" ~/Library/Application\ Support/Karabiner
