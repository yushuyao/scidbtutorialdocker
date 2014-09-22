#!/bin/bash -l

source `dirname $0`/setup.sh

mkdir -p $SCIDBUSERSW

cd $SCIDBUSERSW
wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz
tar zxvf Python-2.7.8.tgz
cd Python-2.7.8
./configure --prefix=$SCIDBUSERSW/python

make -j4
make install

cd $SCIDBUSERSW

wget https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.11.6.tar.gz#md5=f61cdd983d2c4e6aeabb70b1060d6f49
tar zxvf virtualenv-1.11.6.tar.gz
python virtualenv-1.11.6/virtualenv.py --system-site-packages --python=$SCIDBUSERSW/python/bin/python $SCIDBUSERSW/pythonenv
source $SCIDBUSERSW/pythonenv/bin/activate 

pip install numpy --upgrade
pip install requests --upgrade
pip install scipy --upgrade
pip install distribute --upgrade
#pip install matplotlib --upgrade
pip install ipython --upgrade
pip install scidb-py --upgrade
pip install pyzmq tornado jinja2 pysqlite gnureadline --upgrade

wget https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.4.0/matplotlib-1.4.0.tar.gz
tar zxvf matplotlib-1.4.0.tar.gz
cd matplotlib-1.4.0
echo "--- setupext.py~       2014-08-26 02:38:13.000000000 +0100
+++ setupext.py 2014-09-22 01:39:30.194964922 +0100
@@ -942,7 +942,7 @@

         return self._check_for_pkg_config(
             'freetype2', 'ft2build.h',
-            min_version='2.4', version=version)
+            min_version='2.3', version=version)

     def version_from_header(self):
         version = 'Failed to identify version.'
" | patch

python setup.py build
python setup.py install

mkdir -p $SCIDBUSERIPYNB
