#
# Cookbook Name:: machine-base
# Recipe:: default
#
# Copyright (C) 2013 Jonas Pfenniger
#
include_recipe "machine-base::hostname"
include_recipe "machine-base::sysadmin"

include_recipe "build-essential"
include_recipe "logrotate"
include_recipe "openssh"
include_recipe "python"

# Make sure the machine's time is in sync
package "chrony"

package "git"
