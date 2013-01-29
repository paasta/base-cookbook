#
# Cookbook Name:: machine-base
# Recipe:: default
#
# Copyright (C) 2013 MediaCore
#
include_recipe "machine-base::hostname"
include_recipe "build-essential"
include_recipe "logrotate"
include_recipe "motd-tail"
include_recipe "openssh"
include_recipe "python"

package "git"

# Packages we want on all machines (as a sysadmin)
package "curl"
package "htop"
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
  whoopsie
].each{|p| dpkg_package(p){ action(:purge) } }

# Decent VIM config
cookbook_file "/etc/vim/vimrc.local" do
  mode 0644
end

# Too much data on login is not good
file "/etc/update-motd.d/10-help-text" do
  action :delete
end

