#!/bin/bash

FOLDER=/data/git-repo/

if [ ! -d $FOLDER ]; then
	echo "Git source repository is not properly mounted"
	exit 1
fi

cd $FOLDER

join -o "1.1 1.2 2.3" <(git rev-list --objects --all | sort) <(git verify-pack -v objects/pack/*.idx | sort -k3 -n | tail -5 | sort)  \
	| sort -k3 -n -r

