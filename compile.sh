#!/bin/bash

set -e

find . -name "*.html" | while read f ; do
	if ! git ls-files --error-unmatch "$f"  > /dev/null 2>&1; then
		rm "$f"
	fi
done

rm -rf build
cd src

if [[ "$OSTYPE" == "darwin"* ]]; then
	SED=( 'sed' '-i' '' )
else
	SED=( 'sed' '-i' )
fi

find . -type d | while read d ; do
	mkdir -p "../build/$d"
done

# compile MD files
find . -type f -iname "*.md" | while read f ; do
	title=`basename "$f"`
	grip --export --title "${title%.*}" "$f" "../build/${f%md}html"
	MODIFICATION_DATE=`date -r "$f" '+%Y-%m-%d'`
	"${SED[@]}" 's/\/__\/grip\/static\//..\/static\//g' "../build/${f%md}html"
	"${SED[@]}" "s/{JUG:MODIFICATION_DATE}/$MODIFICATION_DATE/g" "../build/${f%md}html"
	touch -r "$f" -c -m "../build/${f%md}html"
done

# copy all other files
find . -type f -not -iname "*.md" | while read f ; do
	cp -p "$f" "../build/$f"
done
