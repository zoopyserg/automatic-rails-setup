# todo: re-design it so that it would check if something is installed before installing it (or remove it before installing) using modprobe or something.
sudo sh -c "sed -i '/deb-src/s/^# //' /etc/apt/sources.list" # enable Source Repos for build-dep)

echo 'Updating'
sudo apt -qq update

echo 'Upgrading'
sudo apt -qq upgrade -y

echo 'Installing System Settings app'
sudo apt -qq install gnome-control-center

echo 'Installing Git'
sudo apt -qq install -y git
git config --global core.editor vim
git config --global core.quotepath off
git config --global user.gpgsign true
git config --global init.defaultBranch true
git config --global push.autoSetupRemote true
git config --global commit.verbose true
git config --global commit.gpgsign true

echo 'Installing Vim'
sudo apt -qq install -y vim vim-gtk
sudo apt -qq install -y neovim

echo 'Installing libs that allow running Viber, Zoom etc'
sudo apt -qq install fuse libfuse2 gdebi

echo 'Setting up Ultrasonic Aliases'
curl -fsSL https://github.com/zoopyserg/ultrasonic-aliases/raw/main/.setup.sh | bash

echo 'Installing Google Chrome'
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-mark hold google-chrome-stable
cd

echo 'Installing Sound Cards'
echo 'pactl set-default-source alsa_input.usb-RODE_Microphones_RODECaster_Pro_00000000001A-01.analog-stereo' >> ~/.bashrc
echo 'pactl set-default-sink alsa_output.pci-0000_0c_00.4.analog-stereo' >> ~/.bashrc

echo 'Installing opera'
sudo snap install opera

echo 'Installing rbenv'
sudo apt -qq install ruby-rspec-core
sudo apt -qq install -y rbenv
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
eval "$(rbenv init -)"
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Todo: Or to install from git repo do this:
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
# git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
# exec $SHELL

echo 'Installing ruby'
rbenv install 3.1.2
rbenv global 3.1.2

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
sudo apt -qq install -y redis-server
sudo apt -qq install -y redis-tools

echo 'Installing chromedriver'
cd ~/Downloads
sudo apt-get install -y unzip
wget https://chromedriver.storage.googleapis.com/107.0.5304.18/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo cp chromedriver /bin/

echo 'Installing Node'
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt -qq install -y gcc g++ make
sudo apt -qq install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y

echo 'Installing GIMP' # more often than not I do need it (to make logos, assets etc.)
sudo apt -qq install -y gimp

echo 'Installing Sensors'
sudo apt -qq install -y lm-sensors

echo 'Installing common production-related dependencies'
sudo apt -qq install -y curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates
sudo apt -qq install -y git libpq-dev wget imagemagick nodejs yarn default-libmysqlclient-dev libmysqlclient-dev mysql-client software-properties-common libcurl4 libcurl4-gnutls-dev locales mc tzdata postgresql-client zip curl pdftk apt-transport-https gpg-agent unzip xvfb libxi6 libgconf-2-4 dirmngr

echo 'Installing Slack'
sudo snap install slack --classic

echo 'Installing XMind'
sudo snap install xmind

echo 'Installing Zoom'
cd ~/Downloads
wget --quiet https://zoom.us/client/5.12.2.4816/zoom_amd64.deb
sudo dpkg -i zoom*.deb

echo 'Installing Viber'
cd ~/Downloads
wget --quiet https://download.cdn.viber.com/desktop/Linux/viber.AppImage

echo 'postgresql'
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt -qq update
sudo apt -qq -y install postgresql postgresql-client-12 postgresql-12 postgresql-contrib libpq-dev postgresql-server-dev-12
sudo -u postgres createuser -dlPE $(whoami)
# Old way of Role creation:
# sudo su - postgres
# psql
# create role myname with createdb login
# quit
# exit
sudo apt -qq install -y mlocate
sudo updatedb
sudo vim $(locate pg_hba.conf | grep -v sample) # if I need to config postgres, but I think I don't need because I have the role set up

# https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
