name             "machine-base"
maintainer       "Jonas Pfenniger"
maintainer_email "jonas@mediacore.com"
license          "All rights reserved"
description      "Installs/Configures machine-base"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe           "machine-base", "Installs the canonical system"
recipe           "machine-base::hostname", "Setups the machine's hostname"
recipe           "machine-base::sysadmin", "Common sysadmin tools"

supports         "ubuntu",  "= 12.04"

depends          "build-essential"
depends          "logrotate"
depends          "openssh"
depends          "python"
