#
# Cookbook Name:: base
# Recipe:: docker
#
# Copyright (C) 2014 Aaron McNeal
#

# Install packages that Docker wants
%w[linux-image-generic-lts-raring linux-headers-generic-lts-raring].each do |pkg|
  package pkg
end

apt_repository "docker" do
  uri "https://get.docker.io/ubuntu docker"
  components ["main"]
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "36A1D7869245C8950F966E92D8576A8BA88D21E9"
end

package "lxc-docker"

