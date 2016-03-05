#!/bin/bash
#Bash Script to install homebrew and all my files
#Install Homebrew if not installed
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#Update Homebrew    
brew update         
#Upgrade existing   
brew upgrade --all  
            
brew tap 'caskroom/cask'
brew tap 'homebrew/bundle'
brew tap 'homebrew/tex'

#Libraries/Packages
brew install 'android-sdk'
brew install 'ant'
brew install 'cmake'
brew install 'cscope'
brew install 'gdbm'
brew install 'xz'
brew install 'gettext'
brew install 'pkg-config'
brew install 'libffi'
brew install 'glib'
brew install 'gmp'
brew install 'libtasn1'
brew install 'nettle'
brew install 'gnutls'
brew install 'hub'
brew install 'openssl'
brew install 'irssi'
brew install 'lame'
brew install 'libevent'
brew install 'libgpg-error'
brew install 'libgcrypt'
brew install 'readline'
brew install 'sqlite'
brew install 'python'
brew install 'python3'
brew install 'macvim'
brew install 'node'
brew install 'pcre'
brew install 'tmux'
brew install 'vim'
brew install 'zsh'

#Brew Cask is Mac apps

#Mac Utilities
brew cask install 'alfred'
brew cask install 'appcleaner'
brew cask install 'bartender'
brew cask install 'ccleaner'
brew cask install 'crashplan'
brew cask install 'hazel'
brew cask install 'keka'
brew cask install 'onyx'
brew cask install 'media-converter'
brew cask install 'logitech-myharmony'
brew cask install 'totalfinder'
brew cask install 'spectacle'
brew cask install 'teamviewer'

#Dev stuff
brew cask install 'cyberduck'
brew cask install 'dash'
brew cask install 'mactex'
brew cask install 'processing'
brew cask install 'genymotion'
brew cask install 'iterm2'
brew cask install 'virtualbox'

#Games
brew cask install 'battle-net'
brew cask install 'league-of-legends'
brew cask install 'dolphin'
brew cask install 'steam'

#Apps
brew cask install 'spotify'
brew cask install 'vlc'
brew cask install 'dropbox'
brew cask install 'skype'
brew cask install 'firefox'
brew cask install 'messenger'

#Cleanup install files
brew cleanup
brew cask cleanup
