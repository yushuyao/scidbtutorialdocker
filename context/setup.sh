#!/bin/bash -l

export CONTEXTPATH=/tmp/context

export SCIDBVERSION=14.8
export SCIDBUSER=scidb
export SCIDBUSERHOME=/home/scidb
export SCIDBPATH=/opt/scidb/$SCIDBVERSION
export SCIDBDATA=/scidbdata
export SCIDBTMP=/scidbtmp
export SCIDBCONFIG=$SCIDBPATH/etc/config.ini
export SCIDBCLUSTER=democluster

export SCIDBUSERSW=$SCIDBUSERHOME/sw
export SCIDBUSERIPYNB=$SCIDBUSERHOME/examples/iPythonNotebook
export SCIDBUSERR=$SCIDBUSERHOME/examples/R
