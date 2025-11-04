Build scripts for CEF (chromium embedded framework)
====================================================

Some helper scripts that hopefully make building CEF a little bit less insane.


Why is that necessary ?
-----------------------

* The chromium code base is as massive as a black hole (several 100 GB), cloning
  it directly from Google servers (by just running `git clone`) usually doesn't work
  due to load limitations on their servers. It really smells like people outside of
  Google aren't supposed to clone and build that thing at all. Therefore we need
  some bit of black magic for getting it cloned step by step (and using shallow
  whereever possible)
* The build system is an extremely complicated and broken mess. Fully understanding
  it can be considered rocket science. And CEF making it even more complicated and broken.
  (therefore we're using our own CEF branch with some fixes).
* Neither official documentation nor their build automation script do actually work.
  Most likely people outside of Google just aren't supposed to build it on their own
  (just alibi-FOSS)
* Successfully running a build is a delicate matter, and sorting out which actions
  to take in which order isn't trivial at all


How to use ?
-------------

* install dependencies via `setup.sh` (tested on Devuan, possibly different on other Distros)
* clone or update sources via `update.sh` (can easily take half a day!)
* full build via `build.sh` (may take a whole day)
* tarballs are placed in: ./code/chromium_git/chromium/src/cef/binary_distrib
