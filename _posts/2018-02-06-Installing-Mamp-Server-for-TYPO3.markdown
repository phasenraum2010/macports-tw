---
layout: post
title:  "Installing Mamp Server for TYPO3"
date:   2018-02-05 13:45:50 +0100
categories: jekyll update
---

# Apache2

## Start with updating

```bash
sudo port -v selfupdate
sudo port upgrade outdated
```

## Cleaup before installing

```bash
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
sudo port uninstall apache2
sudo port clean --all apache2
sudo port install apache2
```
