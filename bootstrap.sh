#!/usr/bin/env bash


#install zsh / oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#prepare to run brewfile
brew tap homebrew/bundle
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew bundle #requires a brewfile!

#brewfile should contain ruby-install, installs most recent ruby versions
ruby-install

#you may have to re-run bundler for various versions of ruby
sudo chmod -R 700 /Library/Ruby/Gems/
gem install bundler
bundle install #requires a Gemfile

dotfile_linker --path .
