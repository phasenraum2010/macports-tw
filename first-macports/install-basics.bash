#!/bin/sh

sudo port -v selfupdate
sudo port upgrade outdated
sudo port install python27
sudo port select --set python python27
sudo port select --set python2 python27
sudo port install py27-matplotlib py27-numpy py27-scipy py27-ipython +notebook
sudo sudo port select --set ipython py27-ipython
sudo port select --set ipython2 py27-ipython
sudo port install py27-notebook

sudo port install ruby25
sudo port select ruby ruby25
sudo port install rbenv ruby-build
gem install jekyll bundler

sudo port install colorsvn cvs2svn p5.26-svn-mirror websvn svndigest subversion-perlbindings subversion-python27bindings subversion-rubybindings
sudo port install git cgit git-cvs github-backup svn2git
sudo port install vim mpvim rails.vim p5.26-text-vimcolor
