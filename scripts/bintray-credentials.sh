#!/bin/bash
DIR=$HOME/.bintray

mkdir $DIR
cat <<EOF >$DIR/.credentials
realm = Bintray API Realm
host = api.bintray.com
user = $BINTRAY_USER
password = $BINTRAY_API_KEY
EOF

cat <<EOF >$DIR/.readonly
realm = Bintray
host = dl.bintray.com
user = $BINTRAY_USER
password = $BINTRAY_API_KEY
EOF

echo "Created ${DIR} files for user ${BINTRAY_USER}"
ls -la $DIR
