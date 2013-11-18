#
# Cookbook Name:: base
# Recipe:: sysadmin
#
# Copyright (C) 2013 Jonas Pfenniger
#

# Install a default mailer that forwards everything to syslog. This allows us
# to get cron outputs on failure without clogging a local mailbox.
#
# If an application needs to send email it needs to connect to an external
# MTA.
#
# See: http://github.com/zimbatm/logmail
logmail_local_cache = "#{Chef::Config[:file_cache_path]}/logmail_1.1.0_all.deb"

remote_file logmail_local_cache do
  source "https://github.com/zimbatm/logmail/releases/download/v1.1.0/logmail_1.1.0_all.deb"
  checksum "fc628970c18d67a2f0a281246f38ed31376410f30c774d9ec9cb72864cd0e4b2"
  mode 0644
end

dpkg_package 'logmail' do
  source logmail_local_cache
  action :install
end
