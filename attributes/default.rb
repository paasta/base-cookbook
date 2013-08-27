default.base.hostname = (node['ec2'] && node['ec2']['instance_id']) || node['hostname']
default.base.login_user = 'login'
default.base.login_public_keys = []

set.openssh.server.password_authentication = "no"
