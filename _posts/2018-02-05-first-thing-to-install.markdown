---
layout: post
title:  "First macports to be installed in the beginning"
date:   2018-02-05 13:45:50 +0100
categories: jekyll update
---

# First macports to install in the beginning

## Start with updating

```bash
sudo port -v selfupdate
sudo port upgrade outdated
```

## Python

```bash
sudo port install python27
sudo port select --set python python27
sudo port select --set python2 python27
sudo port install py27-matplotlib py27-numpy py27-scipy py27-ipython +notebook
```

```bash
sudo sudo port select --set ipython py27-ipython
sudo port select --set ipython2 py27-ipython
sudo port install py27-notebook
sudo port install opencv +python27
sudo port install py27-pip
```

## Ruby for jekyll

```bash
sudo port install ruby25
sudo port select ruby ruby25
sudo port install rb-rubygems
sudo port install rbenv ruby-build
```

## Git, subversion, ...

```bash
sudo port install colorsvn p5.26-svn-mirror svndigest
sudo port install subversion-perlbindings subversion-python27bindings
sudo port install subversion-rubybindings
sudo port install git cgit github-backup
sudo port install vim mpvim rails.vim p5.26-text-vimcolor
sudo gem install jekyll bundler
```

## Video

```bash
sudo port install VLC +dbus +freerdp +huge +jack +pulse +qt5 +shout +smb +svg -X11
sudo port install youtube-dl +ffmpeg +python27
```
