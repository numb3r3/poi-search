#!/bin/bash
# Build nutch on precise64 using apache ant with OpenJDK-1.7.0.
# Prerequisites:
# Must have openjdk RPM installed, and nutch and ant extracted into /opt
ts=`date +%Y%m%d%H%M%S`

. `dirname $0`/setenv.bash

if [ ! $JAVA_HOME ]; then
    export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
fi

if [ ! $NUTCH_HOME ]; then
    NUTCH_HOME="/opt/nutch"
    echo "!!! NUTCH_HOME not set, defaulting to $NUTCH_HOME"
fi

if [ ! $ANT_HOME ]; then
    ANT_HOME="/opt/ant"
    echo "!!! ANT_HOME not set, defaulting to $ANT_HOME"
fi

cd $NUTCH_HOME
if [ -d runtime ]; then
    echo "Backing up previous runtime directory"
    mv runtime runtime.bak-$ts
fi

# build nutch
$ANT_HOME/bin/ant runtime

# Install the custom config file.
cd runtime/local
cp /$SRCROOT/conf/nutch-site.xml conf/nutch-site.xml
mkdir urls && cp /$SRCROOT/conf/urls.txt urls

echo "Build complete, now run the crawler (see the README for details)."
