sudo xcode-select --install

sudo port -v selfupdate
sudo port upgrade outdated
sudo port install python27
sudo port install py27-matplotlib py27-numpy py27-scipy py27-ipython +notebook
sudo sudo port select --set ipython py27-ipython
sudo port select --set ipython2 py27-ipython
sudo port install py27-notebook
