#!/opt/local/bin/perl

echo "--------- START ------------"

$STARTDIR=`pwd`
$MACPORTS_DIR="macports"
$WORKFILES_DIR=$MACPORTS_DIR/"workfiles"
$WORKFILES="~/$WORKFILES_DIR"
$APACHE_CONFIG_FILE="/opt/local/etc/apache2/httpd.conf"

sub 00_create_workdirs {
  echo "########## 00_create_workdirs ##########"
  echo ""
  cd
  mkdir -p $WORKFILES_DIR
  cd macports
  pwd
  ls
}

sub 01_Remove_and_reinstall_Apache2 {
  echo "########## Remove and reinstall Apache2 ##########"
  echo ""
  echo "---------- Update macports ----------"
  sudo port -v selfupdate
  sudo port upgrade outdated
  sudo port uninstall inactive
  echo "---------- uninstall apache2 ----------"
  sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
  sudo port uninstall apache2
  sudo port clean --all apache2
  echo "---------- uninstall apache2 directories ----------"
  cd /opt/local/etc
  pwd
  sudo rm -rf apache2
  pwd
  cd /opt/local/var/log/
  pwd
  sudo rm -rf apache2
  cd
  pwd
  echo "---------- install apache2 ----------"
  sudo port install apache2
}

sub 02_check_Apache2_config {
  echo "---------- 02_check_Apache2_config ----------"
  /opt/local/sbin/apachectl -t
  sudo port unload apache2
  sudo port load apache2
}

sub 03_start_firefox {
  echo "---------- 03_start_firefox  ----------"
  /Applications/Firefox.app/Contents/MacOS/firefox http://localhost/
}

sub 04_edit_APACHE_CONFIG_FILE {
  export WORKFILE_00=$APACHE_CONFIG_FILE
  export WORKFILE_01=$WORKFILES/httpd.conf.01.txt
  export WORKFILE_02=$WORKFILES/httpd.conf.02.txt
  export WORKFILE_03=$WORKFILES/httpd.conf.03.txt
  export WORKFILE_04=$WORKFILES/httpd.conf.04.txt
  export WORKFILE_05=$WORKFILES/httpd.conf.05.txt
  export WORKFILE_06=$WORKFILES/httpd.conf.06.txt
  export WORKFILE_07=$WORKFILES/httpd.conf.07.txt
  export WORKFILE_08=$WORKFILES/httpd.conf.08.txt
  cat $WORKFILE_00 | sed -E 's/#ServerName www.example.com:80/ServerName localhost:80/' > $WORKFILE_01
  cat $WORKFILE_01 | sed -E 's/#(Include etc\/apache2\/extra\/httpd-userdir.conf)/Include etc\/apache2\/extra\/httpd-userdir.conf/' > $WORKFILE_02
  cat $WORKFILE_02 | sed -E 's/#(Include etc\/apache2\/extra\/httpd-manual.conf)/Include etc\/apache2\/extra\/httpd-manual.conf/' > $WORKFILE_03
  cat $WORKFILE_03 | sed -E 's/#(LoadModule ssl_module lib\/apache2\/modules\/mod_ssl.so)/LoadModule ssl_module lib\/apache2\/modules\/mod_ssl.so/' > $WORKFILE_04
  cat $WORKFILE_04 | sed -E 's/#(LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so)/LoadModule userdir_module lib\/apache2\/modules\/mod_userdir.so/' > $WORKFILE_05
  cat $WORKFILE_05 | sed -E 's/#(LoadModule rewrite_module lib\/apache2\/modules\/mod_rewrite.so)/LoadModule rewrite_module lib\/apache2\/modules\/mod_rewrite.so/' > $WORKFILE_06
  cat $WORKFILE_06 | sed -E 's/#(LoadModule mod_mime lib\/apache2\/modules\/mod_mime.so)/LoadModule mod_mime lib\/apache2\/modules\/mod_mime.so/' > $WORKFILE_07
  cat $WORKFILE_07 | sed -E 's/#(LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so)/LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so/' > $WORKFILE_08

  cat $WORKFILE_07 | sed -E 's/#(LoadModule mod_alias lib\/apache2\/modules\/mod_alias.so)/LoadModule mod_alias lib\/apache2\/modules\/mod_negotiation.so/' > $WORKFILE_08
  cat $WORKFILE_07 | sed -E 's/#(LoadModule mod_authz_core lib\/apache2\/modules\/mod_negotiation.so)/LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so/' > $WORKFILE_08
  cat $WORKFILE_07 | sed -E 's/#(LoadModule mod_authz_host lib\/apache2\/modules\/mod_negotiation.so)/LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so/' > $WORKFILE_08
  cat $WORKFILE_07 | sed -E 's/#(LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so)/LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so/' > $WORKFILE_08
  cat $WORKFILE_07 | sed -E 's/#(LoadModule mod_setenvif lib\/apache2\/modules\/mod_negotiation.so)/LoadModule mod_negotiation lib\/apache2\/modules\/mod_negotiation.so/' > $WORKFILE_08

  sudo cp -f $WORKFILE_08 $APACHE_CONFIG_FILE
}

sub  05_copy_APACHE_CONFIG_EXTRA_FILES {
  cd /opt/local/etc/apache2/extra/
  sudo ls
  for SRC_FILE in `ls | grep 'conf.orig'`
  do
    TARGET_FILE=`echo $SRC_FILE | sed 's/conf.orig/conf/g'`
    sudo cp $SRC_FILE $TARGET_FILE
  done
}

00_create_workdirs();
if(true){
    01_Remove_and_reinstall_Apache2();
}
if(true){
  02_check_Apache2_config();
}
if(true){
  03_start_firefox();
}
if(true){
  04_edit_APACHE_CONFIG_FILE();
}
if(true){
  05_copy_APACHE_CONFIG_EXTRA_FILES();
}
if(true){
  02_check_Apache2_config();
}

exit 0;
