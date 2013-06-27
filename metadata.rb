name             "base"
maintainer       "Jonas Pfenniger"
maintainer_email "jonas@pfenniger.name"
license          "All rights reserved"
description      "Installs/Configures base"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe           "base", "Installs the canonical system"
recipe           "base::hostname", "Setups the machine's hostname"
recipe           "base::sysadmin", "Common sysadmin tools"

supports         "ubuntu",  "= 12.04"

depends          "build-essential"
depends          "logrotate"
depends          "openssh"
depends          "python"
