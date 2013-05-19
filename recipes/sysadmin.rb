#
# Cookbook Name:: machine-base
# Recipe:: sysadmin
#
# Copyright (C) 2013 MediaCore
#

# These are the tools that every sysadmin wants to have on his box

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

template "/etc/motd.tail" do
  source "motd.tail.erb"
  group "root"
  owner "root"
  mode "0644"
  backup 0
end
