#!/bin/sh
tag=$1
if [ "$tag" == "" ]; then
	echo "No tag specified"
	exit
fi
agvtool next-version -all
git commit -a -m "Increment CFBundleVersion for $tag"
git tag -m "Tag for $tag" -a $tag
git push origin master
git push --tags