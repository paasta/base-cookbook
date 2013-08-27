name             "base"
maintainer       "Jonas Pfenniger"
maintainer_email "jonas@pfenniger.name"
license          "All rights reserved"
description      "Installs/Configures base"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe           "base",           "Installs all the base recipes"
recipe           "base::hostname", "Setups the machine's hostname"
recipe           "base::sysadmin", "Root tools and setup"
recipe           "base::login",    "SSH login user"
recipe           "base::syslog",   "Syslog support"

supports         "ubuntu",  "= 12.04"

depends          "apt"
depends          "logrotate"
depends          "openssh"
