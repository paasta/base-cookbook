#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (C) 2013 Jonas Pfenniger
#
include_recipe "base::hostname"
include_recipe "base::sysadmin"

include_recipe "build-essential"
include_recipe "logrotate"
include_recipe "openssh"
include_recipe "python"

# Make sure the machine's time is in sync
package "chrony"

package "git"
