sudo sh -c "sed -i '/deb-src/s/^# //' /etc/apt/sources.list" # enable Source Repos for build-dep)

sudo apt update
sudo apt upgrade -y

echo 'Installing Git'
sudo apt install -y git
git config --global core.editor vim

echo 'Installing Vim'
sudo apt install -y vim vim-gtk

echo 'Setting up vim'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Setting up bashrc'
echo 'source ~/.bash_aliases.sh' >> ~/.bashrc

echo 'Installing Google Chrome'
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd

echo 'Installing opera'
snap install opera # sudo?

echo 'Installing rbenv'
sudo apt install -y rbenv
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

echo 'Installing ruby'
rbenv install 3.0.1
rbenv global 3.0.1

echo 'Installing bundler'
gem install bundler

echo 'Installing rails'
gem install rails

echo 'Installing Imagemagick'
sudo apt-get install -y build-essential
sudo apt-get build-dep imagemagick -y
cd ~/Downloads
wget https://download.imagemagick.org/ImageMagick/download/ImageMagick.tar.gz
tar -zxvf ImageMagick.tar.gz
cd ImageMagick-*
sudo apt-get install -y libltdl-dev
./configure --with-modules
make
sudo make install
sudo ldconfig /usr/local/lib
cd

# todo: compile latest version from source
echo 'Installing redis'
sudo apt install -y redis-server

echo 'Installing chromedriver'
cd ~/Downloads
sudo apt-get install -y unzip
wget https://chromedriver.storage.googleapis.com/91.0.4472.19/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo cp chromedriver /bin/

echo 'postgresql'
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql postgresql-client-12 postgresql-12 postgresql-contrib libpq-dev postgresql-server-dev-12 pgadmin3
sudo -u postgres createuser -dlPE $(whoami)
# Old way of Role creation:
# sudo su - postgres
# psql
# create role myname with createdb login
# quit
# exit
sudo apt install -y mlocate
sudo vim $(locate pg_hba.conf | grep -v sample) # if I need to config postgres, but I think I don't need because I have the role set up
