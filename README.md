scidbtutorialdocker
===================

#Introduction
This docker container provides an one-click way to setup a 1-node SciDB for demonstration and tutorial purposes. It will automatically setup the following services:
* SciDB 
* RStudio server with SciDB-R connector
* iPythonNotebook server with SciDB-Py connector, numpy, matplotlib, etc.  

#How to Use
##Start Docker Container
Simply do:
```
docker run -i -t yyao/scidbtutorialdocker
```

##Access the services
###SSH
You can ssh to port 22 with username 'scidb' and password 'demo'. 
```
ssh YOUR_ID -l scidb
```
###RStudio
Open a browser and go to http://YOUR_IP:8787, username 'scidb' and password 'demo'
###iPythonNotebook
Open a browser and go to http://YOUR_IP:8888, no login required
