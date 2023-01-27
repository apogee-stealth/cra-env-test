#!/bin/sh

npm run build
FILE1=`ls build/static/js/main.*.js | head -1`
npm run build -- --swap-env-order
FILE2=`ls build/static/js/main.*.js | head -1`

echo  First build: $FILE1
echo Second build: $FILE2

if [ "$FILE1" = "$FILE2" ]; then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi
