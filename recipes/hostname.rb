
file "/etc/hostname" do
  mode 0644
  content "#{node[:machine_hostname]}\n"
end

template "/etc/hosts" do
  mode 0644
  source "hosts.erb"
  variables hostname: node[:machine_hostname]
end

if node[:hostname] != node[:machine_hostname]
  execute "hostname -b -F /etc/hostname"
  ohai "reload"
end
