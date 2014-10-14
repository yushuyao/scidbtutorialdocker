#!/bin/bash -l

source `dirname $0`/setup.sh

cp $CONTEXTPATH/scidb.repo /etc/yum.repos.d/scidb.repo

#SciDB
yum install -y scidb-$SCIDBVERSION-all-coord unzip wget openssh-server openssh-clients emacs libgomp
yum install -y $CONTEXTPATH/shim-$SCIDBVERSION-1.x86_64.rpm

useradd $SCIDBUSER
echo -e "demo\ndemo" | (passwd --stdin $SCIDBUSER)
echo "scidb ALL=(ALL) ALL" >> /etc/sudoers

cp $CONTEXTPATH/bash_profile $SCIDBUSERHOME/.bash_profile
chown $SCIDBUSER:$SCIDBUSER $SCIDBUSERHOME/.bash_profile

mkdir $SCIDBDATA
mkdir $SCIDBTMP
chown $SCIDBUSER:$SCIDBUSER $SCIDBDATA
chown $SCIDBUSER:$SCIDBUSER $SCIDBTMP

mkdir $SCIDBUSERHOME/.ssh
ssh-keygen -P "" -f $SCIDBUSERHOME/.ssh/id_rsa
cat $SCIDBUSERHOME/.ssh/id_rsa.pub >> $SCIDBUSERHOME/.ssh/authorized_keys
chown -R $SCIDBUSER:$SCIDBUSER $SCIDBUSERHOME/.ssh
chmod -R 0700 $SCIDBUSERHOME/.ssh

cp $CONTEXTPATH/config.ini $SCIDBCONFIG
chown $SCIDBUSER:$SCIDBUSER $SCIDBCONFIG

cp $CONTEXTPATH/shim.conf /var/lib/shim/conf

service postgresql initdb

cp $CONTEXTPATH/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf

#service postgresql start
#service postgresql status

echo "UsePrivilegeSeparation no" >> /etc/ssh/sshd_config

#service sshd start
#service sshd status

#ip addr

#su postgres -c "$SCIDBPATH/bin/scidb.py -m scidb -v init_syscat democluster $SCIDBCONFIG"
#su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v purge democluster $SCIDBCONFIG"
#su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v initall-force democluster $SCIDBCONFIG"
#su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v startall democluster $SCIDBCONFIG"
#su scidb -c "$SCIDBPATH/bin/scidb.py -m scidb -v stopall democluster $SCIDBCONFIG"
