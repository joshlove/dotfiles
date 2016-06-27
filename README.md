# dotfiles
Really simple start for a fresh dotfiles. My last system had gotten needlessly complex and added extra complexity in bootstrapping a new machine.

This attempts to center things around brew/cask, with a simple bash_profile. Aliases are sourced in via an external .aliases file. This means if I decide to make my dotfiles "pairing" compatable we could re-source the profile to bring in customized aliases later on.

bootstrap.sh has all the basics needed to get this going. I'm not a fan of the chmod for the chruby stuff, so I'll prob change that soon.
