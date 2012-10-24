#
# Cookbook Name:: machine-base
# Recipe:: default
#
# Copyright (C) 2012 MediaCore
#
include_recipe "build-essential"
include_recipe "git"
include_recipe "logrotate"
include_recipe "motd-tail"
include_recipe "openssh"
include_recipe "python"

# Packages we want on all machines (as a sysadmin)
package "curl"
package "iotop"
package "screen"
package "sqlite3"
package "strace"
package "vim-nox"

# Packages we don't want
%w[
  apport
  consolekit
  ufw
].each{|p| dpkg_package(p){ action(:purge) } }

# Make sure /etc/hosts is configured properly
template "/etc/hosts" do
  source "hosts.erb"
  mode 0644
end

# Decent VIM config
cookbook_file "/etc/vim/vimrc.local" do
  mode 0644
end

