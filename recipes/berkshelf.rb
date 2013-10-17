#
# Cookbook Name:: base
# Recipe:: berkshelf
#
# Copyright (C) 2013 Jonas Pfenniger
#

package "build-essential"

chef_gem "berkshelf" do
  version node.base.berkshelf_version
end

link "/usr/local/bin/berks" do
  to "/opt/chef/embedded/bin/berks"
end

