
file "/etc/hostname" do
  mode 0644
  content "#{node.machine_base.hostname}\n"
end

template "/etc/hosts" do
  mode 0644
  source "hosts.erb"
  variables hostname: node.machine_base.hostname
end

if node.hostname != node.machine_base.hostname
  execute "hostname -b -F /etc/hostname"
  ohai "reload"
end
