#!/bin/sh

if false; then
  sudo port -v selfupdate
  sudo port upgrade outdated
fi

if false; then
  sudo port install python27
  sudo port select --set python python27
  sudo port select --set python2 python27
  sudo port install py27-matplotlib py27-numpy py27-scipy py27-ipython +notebook
  sudo sudo port select --set ipython py27-ipython
  sudo port select --set ipython2 py27-ipython
  sudo port install py27-notebook
  sudo port install opencv +python27
  sudo port install py27-pip
fi

if true; then
  sudo port install ruby25
  sudo port select ruby ruby25
  sudo port install rb-rubygems
  sudo port install rbenv ruby-build
fi

if true; then
  sudo port install colorsvn p5.26-svn-mirror svndigest subversion-perlbindings subversion-python27bindings subversion-rubybindings
  sudo port install git cgit github-backup
  sudo port install vim mpvim rails.vim p5.26-text-vimcolor
fi

if false; then
  sudo gem install jekyll bundler
fi
