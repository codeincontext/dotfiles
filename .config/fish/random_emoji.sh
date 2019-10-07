#!/bin/bash

emojis=( ✨ ⚡️ 💫 )
num_emojis=${#emojis[*]}
echo "${emojis[$((RANDOM%num_emojis))]}"
