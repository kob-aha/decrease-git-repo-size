#!/bin/bash

GIT_REPO=${1:-$PWD}


docker run --rm  \
	--mount source=$(PWD)/demo-repo,target=/data/git-repo,type=bind \
	git-decrease-size $OPTS
