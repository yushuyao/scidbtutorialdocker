#!/bin/bash -l

source `dirname $0`/setup.sh

yum install -y sqlite sqlite-devel ncurses-devel libpng-devel

su scidb -c $CONTEXTPATH/installipython_asscidb.sh

mkdir $SCIDBUSERIPYNB
cp $CONTEXTPATH/simple.ipynb $SCIDBUSERIPYNB/
chown -R $SCIDBUSER:$SCIDBUSER $SCIDBUSERIPYNB

