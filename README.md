Dotfiles
========

Prerequisites
--------------

``` bash
$ sudo apt-get install git vim vim-latexsuite
```

Installation
------------

``` bash
$ git clone git://github.com/kikoval/dotfiles ~/dotfiles
$ cd ~/dotfiles
$ git submodule init && git submodule update
$ ./makesymlinks.sh
$ source ~/.bashrc
```
