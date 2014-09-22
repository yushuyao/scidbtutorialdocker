#!/bin/bash -l

source `dirname $0`/setup.sh

source $SCIDBUSERSW/pythonenv/bin/activate

ipython notebook --ip="*" --notebook-dir=$SCIDBUSERIPYNB >& $SCIDBUSERIPYNB/log &
