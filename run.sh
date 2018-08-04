#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
GIT_REPO=${1:-$DIR/demo-repo}


docker run --rm  \
	--mount source=${GIT_REPO},target=/data/git-repo,type=bind \
	git-decrease-size \
	| tee ${DIR}/large-files.txt
