#
# Cookbook Name:: base
# Recipe:: cloud-init
#
# Copyright (C) 2013 Jonas Pfenniger
#

package "cloud-init"
package "mdadm"

cookbook_file "/var/lib/cloud/scripts/base-image-setup" do
  owner "root"
  mode 0755
end

cookbook_file "/etc/cloud/templates/sources.list.tmpl" do
  owner "root"
  mode 0644
end

cookbook_file "/etc/cloud/cloud.cfg" do
  owner "root"
  mode 0644
end
