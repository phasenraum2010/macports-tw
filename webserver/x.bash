#!/opt/local/bin/bash


cd ~
export WORKFILES=`pwd`
export WORKFILES=$WORKFILES/macports/workfiles/
mkdir -p $WORKFILES
cd $WORKFILES

export WORKFILE_00="/opt/local/etc/apache2/httpd.conf"
export WORKFILE_01="httpd.conf.01.txt"
export WORKFILE_02="httpd.conf.02.txt"
export WORKFILE_03="httpd.conf.03.txt"
export WORKFILE_04="httpd.conf.04.txt"
export WORKFILE_05="httpd.conf.05.txt"
export WORKFILE_06="httpd.conf.06.txt"
export WORKFILE_07="httpd.conf.07.txt"

cat $WORKFILE_00 | sed 's/#ServerName www.example.com:80/ServerName localhost:80/' > $WORKFILE_01

cat $WORKFILE_01 | sed 's/#(Include etc\/apache2\/extra\/httpd-userdir.conf)/Include etc\/apache2\/extra\/httpd-userdir.conf/' > $WORKFILE_02

cat $WORKFILE_02 | sed 's/#(Include etc\/apache2\/extra\/httpd-manual.conf)/Include etc\/apache2\/extra\/httpd-manual.conf/' > $WORKFILE_03

cat $WORKFILE_03 | sed 's/#(LoadModule ssl_module lib\/apache2\/modules\/mod_ssl.so)/LoadModule ssl_module lib\/apache2\/modules\/mod_ssl.so/' > $WORKFILE_04

cat $WORKFILE_04 | sed 's/#(LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so)/LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so/' > $WORKFILE_05

cat $WORKFILE_05 | sed 's/#(LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so)/LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so/' > $WORKFILE_06

cat $WORKFILE_06 | sed 's/#(LoadModule rewrite_module lib\/apache2\/modules\/mod_rewrite.so)/LoadModule rewrite_module lib\/apache2\/modules\/mod_rewrite.so/' > $WORKFILE_07

sudo cp -f $WORKFILE_07 $WORKFILE_00


/opt/local/sbin/apachectl -t
sudo port unload apache2
sudo port load apache2

exit 0
