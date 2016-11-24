#!/bin/bash

# Shell script to set alias 'song' for running the script
# It is important to execute this file with 'source'

echo -e "Note:\tTo permanently set the alias, pass in the '-p' option\t\tsource setalias.sh -p"

ALIAS="song" # Set the alias to this
UNALIAS=("alias1" "alias2")
PY_PATH="/path/to/python/script/download.py" # Path to the script
### DON'T FORGET TO BACKSLASH THE METACHARS USED IN PATHS, IF ANY ###
### IMPORANT TO PROVIDE ABSOLUTE PATH ###
DESTINATION="/absolute/path/to/destination/folder" # Save the downloaded mp3 file to this directory

PY_CMD="python3"

# Checking directories and files existence
if [ ! "$ALIAS" ]; then
	echo "Provide a non-empty string as alias"
	exit 1
fi

if [ ! -f "$PY_PATH" ]; then
	echo "Incorrect path to the python script!"
	exit 1
fi

if [ ! -d "$DESTINATION" ]; then
	echo "Destination directory does not exist"
	read -ep "Would like to create the directory? (y/n)\t" verdict
	CHOICES=( "y", "Y", "Yes", "yes", "YES" )
	if [ verdict in ${CHOICES[@]} ]; then
		mkdir $DESTINATION
		if [ $? ]; then
			echo "Directory "$DESTINATION" has been successfully created!"
		else
			echo "Error creating directory"
			exit 2
		fi
	else
		exit 0
	fi
fi

for aka in ${UNALIAS[@]}; do
	unalias $aka 2> /dev/null
done

FINAL="$PY_CMD $PY_PATH --p=\\\"$DESTINATION\\\""
alias $ALIAS="$FINAL"
echo "Alias $ALIAS has been set"

# Appending the alias command to bash config file, if "-p" is passed in
if [[ $# != 0 ]] && [[ "$1" == "-p" ]]; then
	FINAL="alias $ALIAS=\"$FINAL\""
	if [ -f ~/.bash_profile ]; then
		sudo echo $FINAL >> ~/.bash_profile
	elif [ -f ~/.bashrc ]; then
		sudo echo $FINAL >> ~/.bashrc
	fi
fi
