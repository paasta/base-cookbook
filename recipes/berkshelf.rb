#
# Cookbook Name:: base
# Recipe:: berkshelf
#
# Copyright (C) 2013 Jonas Pfenniger
#

prefix = "/opt/chef/embedded/bin"

package "build-essential"

gem_package "berkshelf" do
  gem_binary File.join(prefix, "gem")
  version node.base.berkshelf_version
end

link "/usr/local/bin/berks" do
  to File.join(prefix, "berks")
end

#XXX: Re-jigger the solve gem as it's breaking things!
gem_package "solve" do
  action :remove
end

gem_package "solve" do
  action :install
  version node.base.berkshelf_solve_version
end



