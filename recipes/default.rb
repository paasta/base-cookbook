#
# Cookbook Name:: machine-base
# Recipe:: default
#
# Copyright (C) 2013 MediaCore
#
include_recipe "machine-base::hostname"
include_recipe "machine-base::sysadmin"

include_recipe "build-essential"
include_recipe "logrotate"
include_recipe "openssh"
include_recipe "python"

package "git"
