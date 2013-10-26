#
# Cookbook Name:: base
# Recipe:: apt
#
# Copyright (C) 2013 Jonas Pfenniger
#

include_recipe "apt"

cookbook_file "/etc/apt/apt.conf.d/02compress-indexes" do
  owner "root"
  mode 0644
end

cookbook_file "/etc/apt/sources.list" do
  owner "root"
  mode 0644
  notifies :run, "execute[apt-get update]", :immediately
end

