# Rails Setup on fresh Ubuntu 20.04 install

A quick, easy, and fully automatic way to get a complete Ruby on Rails Development Environment onto your fresh Ubuntu 20.04 PC.

Have a fresh Ubuntu 20.04 system?

Looking for a way to set it up for Rails?

Launch this script, go grab a coffee, and when you come back it will be done.

The approximate time of execution is about 15 minutes (more or less, depending on how fast is your CPU).

Saves you 3-5 hours of setting up Rails manually.

Want to thank me?
Please support me on Patreon, I'll be happy: https://www.patreon.com/vinogradoff_group_tip_jar/

# Setup
````
curl -fsSL https://github.com/zoopyserg/automatic-rails-setup/raw/main/ubuntusetup.sh | bash
````
(this will run all the installation procedures).

# What it does
Sets up:
````
- Source Repos for build-dep
- Updates
- Upgrades
- Git
- Vim & Vim-GTK
- Ultrasonic Aliases (my other project)
- Google Chrome
- Opera
- RBenv
- Latest Ruby (and makes it global)
- Bundler
- Latest Rails
- Imagemagick (from source)
- Redis Server
- Chromedriver
- Postgresql (install & setup)
````

In the end of the script you will be promped to `Enter a New Password for a New Role` (because it sets up PostgreSQL, and creates a Role which will be same as your username on your current system, this is often needed for development).

Once you enter the password, the system will do a little more magic and then it will open `pg_hba.conf` (to let you update login policies for Postgres if you need to).

Once you see `pg_hba.conf` opened in Vim - the script is over, and the installation of Rails environment is completed.

At this point, you can move on and make your awesome Rails projcts.
