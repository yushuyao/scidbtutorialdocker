#!/bin/bash -l

source `dirname $0`/setup.sh

service postgresql start
service postgresql status

service sshd start
service sshd status

service shimsvc start
service shimsvc status

ip addr

if [ ! -f $SCIDBDATA/000/0/scidb.log ]; then
  #initialize scidb if not already done so
  #when docker restart it won't re-initialize scidb again
  su postgres -c "$SCIDBPATH/bin/scidb.py -m scidb -v init_syscat democluster $SCIDBCONFIG"
  su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v purge democluster $SCIDBCONFIG"
  su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v initall-force democluster $SCIDBCONFIG"
fi

su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v startall democluster $SCIDBCONFIG"
su scidb -c "$SCIDBPATH/bin/iquery -aq \"list('arrays')\""

#tail -F $SCIDBDATA/000/0/scidb.log

#su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v stopall democluster $SCIDBCONFIG"
service rstudio-server start

su scidb -c "$CONTEXTPATH/startipython_asscidb.sh"

if [ ! "$STARTSHELL" == "" ]
then  /bin/bash
else sleep infinity
fi
