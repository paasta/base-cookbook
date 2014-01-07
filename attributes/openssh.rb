include_attribute "openssh"

# Harden sshd
default.openssh.server.hostbased_authentication = "no"
default.openssh.server.password_authentication = "no"
default.openssh.server.permit_empty_passwords = "no"
default.openssh.server.permit_root_login = "no"
default.openssh.server.subsystem = "sftp /usr/lib/openssh/sftp-server"
default.openssh.server.use_privilege_separation = "yes"
