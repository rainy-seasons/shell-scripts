#!/bin/bash

# script for choosing commonly edited configs for edit
# define array of configs with numbers ordered alphabetically
#       choose config with number

# config list by path
declare -a configs=(
~/.vimrc
)

# list configs
i=1
for o in "${configs[@]}"
do
 printf "%d. %s\n" $((i++)) $o
done

# take input
echo "Enter config to edit (number): "
read choice

# check validity of input
if [[ $choice -gt ${#configs[@]} ]]
then
  echo "Invalid index. Too high."
elif [[ $choice -lt 1 ]]
then
  echo "Invalid index. Too low."
else
  vim -o ${configs[$choice-1]} # open selected file
fi
