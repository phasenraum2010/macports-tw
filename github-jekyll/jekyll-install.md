Jekill for GitHub Pages
=======================

https://jekyllrb.com/
https://github.com/jekyll/jekyll

Install:

https://trac.macports.org/wiki/howto/RubyOnRails



sudo port install rb-rubygems

sudo port install ruby25
sudo port select ruby ruby25
sudo port install rbenv ruby-build

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent

Adding your SSH key to the ssh-agent


git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"

Start the ssh-agent in the background.
$ eval "$(ssh-agent -s)"
Agent pid 59566

If you're using macOS Sierra 10.12.2 or later, you will need to modify your ~/.ssh/config file to automatically load keys into the ssh-agent and store passphrases in your keychain.
