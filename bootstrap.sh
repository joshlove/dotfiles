#!/usr/bin/env bash

#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#prepare to run brewfile
brew tap homebrew/bundle
brew bundle #requires a brewfile!

#brewfile should contain ruby-install, installs most recent ruby versions
ruby-install
 
#you may have to re-run bundler for various versions of ruby
sudo chmod -R 777 /Library/Ruby/Gems/
gem install bundler
bundle install #requires a Gemfile

#cask is part of brew that install GUI applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew bundle Caskfile
