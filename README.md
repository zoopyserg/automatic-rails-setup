# Rails Setup on fresh Ubuntu install

A fast &amp; easy way complete Ruby on Rails Development Environment on a fresh install of Ubuntu (in under 15 minutes)

````
cd
git init
git remote add origin https://github.com/zoopyserg/ubuntu-rails-setup.git
git fetch origin
git checkout -b main --track origin/main
````

(this will download aliases, vimrc and ubuntu setup script to the $HOME directory)

And then do:
````
~/ubuntusetup.sh
````
(this will run all the installations).

Note, this installer is still in Beta, I will let you know when it's fully functional.
This is a rough idea.

Then go to Vim and do:
````
:BundleInstall
````
And you're good to go.

# Usage:
Run the Rails server:
````
cd <your project>
dbrs
````
This will launch Bundle Install, (re)create the database (drop/create/migrate/test:prepare/seed etc.) and run the Rails server.

Run tests:
````
cd <your project>
dbr
````
This will launch Bundle Install, (re)create the database (drop/create/migrate/test:prepare/seed etc.) and run `rspec .`.

Check out aliases for more good things you can do with one button press.

# Why VIM:
I prefer to have an orchestra of small tools that do their single job very well.
Rather than have huge IDEs that crash whenever they want (like Rubymine or whatever).

I've built many websites using this setup, and always worked faster than any Rails programmer I know.
Check out my Caperoma project for even more Rails optimization.
