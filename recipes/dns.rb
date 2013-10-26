#
# Cookbook Name:: base
# Recipe:: dns
#
# Copyright (C) 2013 Jonas Pfenniger
#

package "dnsmasq"

service "dnsmasq" do
  action [:enable, :start]
end

template "/etc/dnsmasq.conf" do
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[dnsmasq]", :immediately
end
