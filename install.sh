# SSH key creation
ssh-keygen -t rsa -b 8192

# Basic packages that I normally want installed
sudo apt install vim-gtk cmake git build-essential texlive-full


# Configure .vimrc and Vim plugins
mv .vimrc ~
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install zsh, oh-my-zsh, and .zshrc
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc ~

######################### PROGRAMMING LANGUAGES #########################


# Python libraries, configure virtualenvwrapper
# Origin:
# http://exponential.io/blog/2015/02/10/install-virtualenv-and-virtualenvwrapper-on-ubuntu/
sudo apt install python3-dev python3-pip python3-requests python3-pandas
printf '\n%s\n%s\n%s' '# virtualenv' 'export WORKON_HOME=~/.virtualenvs' \
  'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.zshrc
mkdir -p $WORKON_HOME

# Java 8 installation
# Origin:
# https://askubuntu.com/questions/521145/how-to-install-oracle-java-on-ubuntu-14-04
sudo apt-add-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.zshrc

# JavaScript installation
# Origin:
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E zsh -
sudo apt-get install -y nodejs

# Haskell libraries
# Origin: https://www.haskell.org/downloads/linux
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.22 ghc-7.10.3
cat >> ~/.zshrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH

