# machine-base cookbook

One cookbook to rule them all...

Basic config for all the machines. This is where we put things that
we expect to have on all the machines.

This cookbook is to be shared between all the MediaCore projects and
also acts as an example on how to build cookbooks.

This cookbook was created with `berks cookbook foobar --vagrant --git
--foodcritic -L mit -m MediaCore -e jonas@mediacore.com` and then
adapted.

Verification of the cookbook's structure is done by running
`thor foodcritic:lint`.

Testing of the cookbook is done by running `vagrant up`

The "./bootstrap" file might act as an example on how to initialize the
boxes.

# Requirements

Platform
--------

* Ubuntu Precise

Cookbooks
---------

The following Opscode cookbooks are dependencies:

* build-essential
* git
* logrotate
* motd-tail
* openssh
* python

# Usage

Put machine-base:default it as first include in all runs.

# Attributes

None yet

# Recipes

default
-------

# Author

Author:: Jonas Pfenniger <jonas@mediacore.com>

Copyright 2012, MediaCore.
