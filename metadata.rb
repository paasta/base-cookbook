name             "machine-base"
maintainer       "MediaCore"
maintainer_email "info@mediacore.com"
license          "All rights reserved"
description      "Installs/Configures machine-base"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe           "machine-base", "Installs the canonical system"
recipe           "machine-base::hostname", "Setups the machine's hostname"

supports         "ubuntu",  "= 12.04"

depends          "build-essential"
depends          "logrotate"
depends          "motd-tail"
depends          "openssh"
depends          "python"
