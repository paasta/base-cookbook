#
# Cookbook Name:: base
# Recipe:: sysadmin
#
# Copyright (C) 2013 Jonas Pfenniger
#

# These are the tools that every sysadmin wants to have on his box

# Packages we want on all machines (as a sysadmin)
%w[
  bmon
  cbm
  curl
  htop
  iftop
  iotop
  ngrep
  netcat
  screen
  strace
  vim-nox
].each{|p| package(p)}

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
