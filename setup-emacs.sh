#!/bin/bash

REPO=https://github.com/aycanirican/.emacs.d.git
MONACO=http://jorrel.googlepages.com/Monaco_Linux.ttf
FONTSDIR=~/.fonts

installDeps () {
    sudo apt-get install git-core magit ghc6 happy alex haskell-mode cabal-install bbdb
}

installFont () {
    mkdir $FONTSDIR
    wget $MONACO -O $FONTSDIR/Monaco.ttf
    sudo fc-cache -f -v
}

installDotEmacs () {
    cd ~/
    git clone $REPO
    echo "(load \"~/.emacs.d/bootstrap-init.el\")" >> ~/.emacs
}

installGhcMod () {
    cabal update
    mkdir -p ~/elisp/ghcmod/
    cabal install ghc-mod
    cd ~/.cabal/share/ghc-mod-*
    make
    cp ghc* ~/elisp/ghcmod/
}

installDeps && installFont && installDotEmacs && installGhcMod
