sudo sed -i '/deb-src/s/^# //' /etc/apt/sources.list && apt update # first enable Sources in your repos (as some of these will be built from source, so they will require build-dep)

sudo apt update
sudo apt upgrade -y

echo 'Vim'
sudo apt install -y vim vim-gtk

echo 'Git'
sudo apt install -y git
git config --global core.editor vim

echo 'rbenv'
sudo apt install -y rbenv
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

echo 'ruby'
rbenv install 3.0.1
rbenv global 3.0.1

echo 'Google Chrome'
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'bundler'
gem install bundler

echo 'rails'
gem install rails

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

echo 'opera'
snap install opera

echo 'Imagemagick'
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

## note that I have to compile it with-dependencies or something, so that jpeg convert works
# redis 
# i did sudo apt install redis, then compiled from source, then replaced old one with new ones using cp
echo 'redis'
sudo apt install -y redis-server

# 
echo 'chromedriver'
cd ~/Downloads
sudo apt-get install -y unzip
wget https://chromedriver.storage.googleapis.com/91.0.4472.19/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo cp chromedriver /bin/

echo 'vimrc'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo 'source ~/.bash_aliases.sh' >> ~/.bashrc
