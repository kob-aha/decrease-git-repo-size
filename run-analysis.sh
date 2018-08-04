#!/bin/sh -x

FOLDER=/data/git-repo/

if [ ! -d $FOLDER ]; then
	echo "Git source repository is not properly mounted"
	exit 1
fi

cd $FOLDER

#join -o "1.1 1.2 2.3" <( git rev-list --objects --all | sort ) <( git verify-pack -v objects/pack/*.idx | sort -k3 -n | tail -5 | sort)  | sort -k3 -n

git rev-list --objects --all \
	| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
	| sed -n 's/^blob //p' \
	| sort --numeric-sort --key=2 \
	| cut -c 1-12,41- \
	| numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest \
	| uniq
