#!/opt/local/bin/bash

if false; then

sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
sudo port uninstall apache2
sudo port clean --dist apache2

cd /opt/local/etc
pwd
sudo rm -rf apache2
pwd
cd /opt/local/var/log/
pwd
sudo rm -rf apache2
cd ~
pwd
cd macports
pwd

sudo port install apache2

fi

if false; then

/opt/local/sbin/apachectl -t
sudo port unload apache2
sudo port load apache2

fi

if false; then

/Applications/Firefox.app/Contents/MacOS/firefox http://localhost/

fi

if false; then

  export WORKFILES= ~/macports/workfiles
  mkdir -p $WORKFILES
  cd $WORKFILES

  export WORKFILE_00=/opt/local/etc/apache2/httpd.conf
  export WORKFILE_01=httpd.conf.01.txt
  export WORKFILE_02=httpd.conf.02.txt
  export WORKFILE_03=httpd.conf.03.txt
  export WORKFILE_04=httpd.conf.04.txt
  export WORKFILE_05=httpd.conf.05.txt
  export WORKFILE_06=httpd.conf.06.txt
  export WORKFILE_07=httpd.conf.07.txt

  cat $WORKFILE_00 | sed 's/#ServerName www.example.com:80/ServerName localhost:80/' > $WORKFILE_01

  cat $WORKFILE_01 | sed 's/#(Include etc\/apache2\/extra\/httpd-userdir.conf)/$1/' > $WORKFILE_02

  cat $WORKFILE_02 | sed 's/#(Include etc\/apache2\/extra\/httpd-manual.conf)/$1/' > $WORKFILE_03

  cat $WORKFILE_03 | sed 's/#(LoadModule ssl_module lib\/apache2\/modules\/mod_ssl.so)/$1/' > $WORKFILE_04

  cat $WORKFILE_04 | sed 's/#(LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so)/$1/' > $WORKFILE_05

  cat $WORKFILE_05 | sed 's/#(LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so)/$1/' > $WORKFILE_06

  cat $WORKFILE_06 | sed 's/#(LoadModule rewrite_module lib\/apache2\/modules\/mod_rewrite.so)/$1/' > $WORKFILE_07

  sudo cp -f $WORKFILE_07 $WORKFILE_00

fi

#---
#LoadModule ssl_module modules/mod_ssl.so
#LoadModule userdir_module lib/apache2/modules/mod_userdir.so
#LoadModule rewrite_module lib/apache2/modules/mod_rewrite.so
#---
#---
#LoadModule log_debug_module lib/apache2/modules/mod_log_debug.so
#LoadModule log_forensic_module lib/apache2/modules/mod_log_forensic.so
#---
#LoadModule usertrack_module lib/apache2/modules/mod_usertrack.so
#LoadModule unique_id_module lib/apache2/modules/mod_unique_id.so
#---
#LoadModule dav_module lib/apache2/modules/mod_dav.so
#LoadModule dav_fs_module lib/apache2/modules/mod_dav_fs.so
#LoadModule dav_lock_module lib/apache2/modules/mod_dav_lock.so

if true; then

  cd /opt/local/etc/apache2/extra/
  sudo ls
  for SRC_FILE in `ls | grep 'conf.orig'`
  do
    TARGET_FILE=`echo $SRC_FILE | sed 's/conf.orig/conf/'`
    sudo cp $SRC_FILE $TARGET_FILE
  done

if false; then
sudo cp /opt/local/etc/apache2/extra/httpd-userdir.conf.orig /opt/local/etc/apache2/extra/httpd-userdir.conf
sudo cp /opt/local/etc/apache2/extra/httpd-manual.conf.orig /opt/local/etc/apache2/extra/httpd-manual.conf
sudo cp /opt/local/etc/apache2/extra/httpd-ssl.conf.orig /opt/local/etc/apache2/extra/httpd-ssl.conf
sudo cp /opt/local/etc/apache2/extra/httpd-languages.conf.orig /opt/local/etc/apache2/extra/httpd-languages.conf
sudo cp /opt/local/etc/apache2/extra/httpd-multilang-errordoc.conf.orig /opt/local/etc/apache2/extra/httpd-multilang-errordoc.conf
fi

exit 0
