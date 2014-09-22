#!/bin/bash -l

source `dirname $0`/setup.sh

cd /root

yum groupinstall -y "Development Tools"

wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

wget http://download2.rstudio.org/rstudio-server-0.98.1062-x86_64.rpm
yum install -y --nogpgcheck rstudio-server-0.98.1062-x86_64.rpm libcurl-devel R-devel

ln -sf /usr/lib/rstudio-server/extras/init.d/redhat/rstudio-server /etc/init.d/rstudio-server

echo -e "
local({r <- getOption(\"repos\")
       r[\"CRAN\"] <- \"http://cran.r-project.org\"
       options(repos=r)
})
" > $SCIDBUSERHOME/.Rprofile
chown $SCIDBUSER:$SCIDBUSER $SCIDBUSERHOME/.Rprofile

#mkdir $SCIDBUSERHOME/R
#echo "export R_LIBS=$SCIDBUSERHOME/R">>$SCIDBUSERHOME/.bashrc

#chown $SCIDBUSER:$SCIDBUSER $SCIDBUSERHOME/R

echo -e "
install.packages('devtools')
library('devtools')
install_github(\"SciDBR\",\"paradigm4\",quick=TRUE)" > /tmp/inst_scidbr.R

chown $SCIDBUSER:$SCIDBUSER /tmp/inst_scidbr.R

su - $SCIDBUSER -c "Rscript /tmp/inst_scidbr.R"

mkdir $SCIDBUSERR
cp $CONTEXTPATH/simple.R $SCIDBUSERR/
chown -R $SCIDBUSER:$SCIDBUSER $SCIDBUSERR
