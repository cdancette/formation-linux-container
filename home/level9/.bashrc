export LEVEL9_FILENAME=$(mktemp /tmp/level6-XXXXXX)
export LEVEL9_CONTENT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo $LEVEL9_CONTENT >> $LEVEL9_FILENAME
export LEVEL9_DESTINATION=$(mktemp /tmp/level6-XXXXXX)
rm -r $LEVEL9_DESTINATION
