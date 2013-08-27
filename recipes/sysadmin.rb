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
].each{|p| package(p)}

# Too much data on login is not good
file "/etc/update-motd.d/10-help-text" do
  action :delete
end

# Message on login
template "/etc/motd.tail" do
  source "motd.tail.erb"
  group "root"
  owner "root"
  mode "0644"
  backup 0
end

### SSH server ###

include_recipe "openssh"

### Login user config ###
# SSH as this user but automatically sudo su to root

cookbook_file "/bin/rootlogin" do
  mode 0755
end

file "/etc/sudoers.d/01-#{node.base.login_user}" do
  mode 0440
  content "#{node.base.login_user} ALL=(ALL) NOPASSWD:ALL\n"
end

user node.base.login_user do
  shell "/bin/rootlogin"
  action :create
end

directory "/home/#{node.base.login_user}" do
  mode 0755
end
directory "/home/#{node.base.login_user}/.ssh" do
  mode 0700
  owner node.base.login_user
  group node.base.login_user
end

authorized_keys = [
  node.base.login_public_keys,
  (File.read('/home/vagrant/.ssh/authorized_keys').split("\n") rescue []),
  (File.read('/home/ubuntu/.ssh/authorized_keys').split("\n") rescue [])
].flatten.compact

file "/home/#{node.base.login_user}/.ssh/authorized_keys" do
  mode 0600
  owner node.base.login_user
  group node.base.login_user
  content authorized_keys.join("\n") + "\n"
end

# Make sure we don't allow to login with the ubuntu user
user "ubuntu" do
  action :remove
end

### Root user config ###

# Decent VIM config
package "vim-nox"
cookbook_file "/root/.vimrc" do
  mode 0644
end
directory "/root/.vim" do
  mode 0755
end

# Use zsh
package "zsh"
user "root" do
  shell "/bin/zsh"
  action :modify
end
template "/root/.zshrc" do
  source "zshrc.erb"
  mode 0644
end
