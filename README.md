# Rails Setup on fresh Ubuntu 20.04 install

A quick, easy, and fully automatic way to get a complete Ruby on Rails Development Environment onto your fresh Ubuntu 20.04 PC.

Have a fresh Ubuntu 20.04 system?

Looking for a way to set it up for Rails?

Launch this script, go grab a coffee, and when you come back it will be done.

The approximate time of execution is about 15 minutes (more or less, depending on how fast is your CPU).

Saves you 3-5 hours of setting up Rails manually.

Want to thank me?
Please support me on Patreon, I'll be happy: (https://www.patreon.com/vinogradoff_group_tip_jar/)[https://www.patreon.com/vinogradoff_group_tip_jar/]

# Setup
````
cd
git init
git remote add origin https://github.com/zoopyserg/ubuntu-rails-setup.git
git fetch origin
git checkout -b main --track origin/main
````

(this will download aliases, vimrc, and ubuntu setup script to your $HOME directory)

And then do:
````
sudo chmod +x ubuntusetup.sh
~/ubuntusetup.sh
````
(this will run all the installation procedures).

After it's done, just go to Vim and do:
````
:BundleInstall
````
to install the plugins. And you're good to go.

# Usage:
Run the Rails server (with all bundle installations, database create/migrate/test:prepare/seed etc):
````
cd <your project>
dbrs
````

Run tests:
````
cd <your project>
dbr
````
Launches Bundle Install, (re)creates the database (drop/create/migrate/test:prepare/seed etc.) and runs `rspec .`.

Yes, it recreates the database and migrates again.

Gone are the days when a project with a 3-year-old commit history stops working because the old migrations broke and no one has time to fix them.

Run tests even faster:
````
cd <your project>
r
````
Yes, just `r`. `rspec .` is too long.

To some, it sounds funny, but to a person who typed `rspec .` thousands of times this is a relief.

Here are some other aliases:
````
s='git status'
b='git branch'
l='git log'
a='git add -A'
c='git commit'
ca='git commit --amend'
r='rspec .'
bu='bundle'
rs='rails server'
dbc='rails db:create'
dbm='rails db:migrate'
dbt='rails db:test:prepare'
dbd='rails db:drop'
dbs='rails db:seed'
db='dbd && dbc && dbm && dbt && dbs'
dbr='bu && db && r'
dbrs='bu && db && rs'
e='exit'
off='sudo poweroff'
````

Check out all aliases in `.aliases.sh` file.
The list is constantly growing.

# But Why VIM? Isn't it too old?
You know what they say. If it ain't broke, don't fix it.

Plus, I prefer to have an orchestra of small tools that do their small job well.

Rather than depend on bulky IDEs that don't work.

When I am working on a social network I honestly don't have time to wait until Rubymine team fixes a bug or creates an adaptor or something.

I do it myself in VIMscript and move on.

On that level of programming, every second of downtime costs more than Rubymine license.

I've built many websites using this setup.

Plus VIM is a good tool for developing metaprogramming mindset.
