#!/bin/bash -l

source `dirname $0`/setup.sh

$CONTEXTPATH/installscidb.sh
$CONTEXTPATH/installrstudio.sh
$CONTEXTPATH/installipython.sh
