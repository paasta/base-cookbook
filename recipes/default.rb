#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (C) 2013 Jonas Pfenniger
#

# Make sure the apt indexes are up to date
include_recipe "base::apt"

# Make sure the hostname is correct before doing anything else
include_recipe "base::hostname"

# Configure system logging
include_recipe "base::syslog"

# Configure dns
include_recipe "base::dns"

# Configure local mail delivery (syslog)
include_recipe "base::mail"

### Order independent starting from here ###

# Cloud-init
include_recipe "base::cloud-init"

# Ansible
include_recipe "base::ansible"

# Base packages
include_recipe "base::packages"

# Docker packages
if node.base.install_docker
  include_recipe "base::docker"
end

# Berkshelf
if node.base.install_berkshelf
  include_recipe "base::berkshelf"
end

# Configure root and it's tools
include_recipe "base::sysadmin"

# Configures OpenSSH
include_recipe "base::openssh"

# Configure the remote login user
include_recipe "base::login"

# Configure the app environment
include_recipe "base::app"

