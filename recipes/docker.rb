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


