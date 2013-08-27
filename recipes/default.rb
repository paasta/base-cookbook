#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (C) 2013 Jonas Pfenniger
#

# Make sure the hostname is correct before doing anything else
include_recipe "base::hostname"

# Make sure we have the latest apt source lists
include_recipe "apt"

#
include_recipe "logrotate"

# Make sure the machine's time is in sync
package "chrony"

# Configure the sysadmin and it's tools
include_recipe "base::sysadmin"

# Configure the remote login user
include_recipe "base::login"

# Packages we don't want
%w[
  apport
  ufw
  whoopsie
].each{|p| dpkg_package(p){ action(:purge) } }
