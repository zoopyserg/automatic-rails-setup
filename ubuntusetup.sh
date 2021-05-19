sudo sh -c "sed -i '/deb-src/s/^# //' /etc/apt/sources.list" # enable Source Repos for build-dep)

echo 'Updating'
sudo apt -qq update

echo 'Upgrading'
sudo apt -qq upgrade -y

echo 'Installing Git'
sudo apt -qq install -y git

echo 'Installing Vim'
sudo apt -qq install -y vim vim-gtk

echo 'Setting up Ultrasonic Aliases'
curl -fsSL https://github.com/zoopyserg/ultrasonic-aliases/raw/main/.setup.sh | bash

echo 'Installing Google Chrome'
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd

echo 'Installing opera'
sudo snap install opera

echo 'Installing rbenv'
sudo apt -qq install -y rbenv
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
eval "$(rbenv init -)"
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

echo 'Installing ruby'
rbenv install 3.0.1
rbenv global 3.0.1

echo 'Installing bundler'
gem install bundler

echo 'Installing rails'
gem install rails

echo 'Installing Imagemagick'
sudo apt -qq install -y build-essential
sudo apt -qq build-dep imagemagick -y
cd ~/Downloads
wget https://download.imagemagick.org/ImageMagick/download/ImageMagick.tar.gz
tar -zxvf ImageMagick.tar.gz
cd ImageMagick-*
sudo apt -qq install -y libltdl-dev
./configure --with-modules
make
sudo make install
sudo ldconfig /usr/local/lib
cd

# todo: compile latest version from source
echo 'Installing redis'
sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt -qq install -y redis-server
sudo apt -qq install -y redis-tools

echo 'Installing chromedriver'
cd ~/Downloads
sudo apt-get install -y unzip
wget https://chromedriver.storage.googleapis.com/91.0.4472.19/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo cp chromedriver /bin/

echo 'Installing Node'
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt -qq install -y gcc g++ make
sudo apt -qq install -y nodejs
sudo npm install --global yarn

echo 'Installing GIMP' # more often than not I do need it (to make logos, assets etc.)
sudo apt -qq install -y gimp

echo 'Installing production-related dependencies'
sudo apt-get install curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates

echo 'postgresql'
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt -qq update
sudo apt -qq -y install postgresql postgresql-client-12 postgresql-12 postgresql-contrib libpq-dev postgresql-server-dev-12 pgadmin3
sudo -u postgres createuser -dlPE $(whoami)
# Old way of Role creation:
# sudo su - postgres
# psql
# create role myname with createdb login
# quit
# exit
sudo apt -qq install -y mlocate
sudo vim $(locate pg_hba.conf | grep -v sample) # if I need to config postgres, but I think I don't need because I have the role set up
