# SSH key creation
ssh-keygen -t rsa -b 8192

# Get Chrome
# Source: https://askubuntu.com/questions/510056/how-to-install-google-chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update 
sudo apt install google-chrome-stable

# Get Spotify
# Source: https://www.spotify.com/uk/download/linux/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# Get Dropbox
# Source: https://www.dropbox.com/install-linux
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &

# Get Insync
cd ~ && wget https://d2t3ff60b2tol4.cloudfront.net/builds/insync_1.3.18.36169-zesty_amd64.deb
sudo dpkg -i insync*.deb
rm insync*.deb

# Basic packages that I normally want installed
sudo apt install vim-gtk cmake git build-essential texlive-full

# Latexmk configuration file
cp .latexmkrc ~


# Configure .vimrc and Vim plugins
mv .vimrc ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java10-installer
sudo apt-get install oracle-java10-set-default

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
sudo apt-get install -y cabal-install ghc
cat >> ~/.zshrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH

