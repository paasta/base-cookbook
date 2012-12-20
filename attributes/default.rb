default[:machine_hostname] = (node[:ec2][:instance_id] || node[:hostname])
