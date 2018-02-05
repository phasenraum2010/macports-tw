---
layout: post
title:  "Installing Python!"
date:   2018-02-05 13:45:50 +0100
categories: jekyll update
---


sudo xcode-select --install

sudo port -v selfupdate

sudo port upgrade outdated

sudo port install python27

sudo port select --set python python27
sudo port select --set python2 python27

sudo port install py27-matplotlib py27-numpy py27-scipy py27-ipython +notebook
sudo sudo port select --set ipython py27-ipython
sudo port select --set ipython2 py27-ipython
sudo port install py27-notebook
