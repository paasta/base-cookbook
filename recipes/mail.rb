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
logmail_deb = 'logmail_1.0.0_all.deb'
logmail_local_cache = "#{Chef::Config[:file_cache_path]}/#{logmail_deb}"

remote_file logmail_local_cache do
  source "http://zimbatm.s3.amazonaws.com/logmail/#{logmail_deb}"
  checksum "d0357d6634deea01a99361ea46fc4b92b4f1b602c2e6a6dd07c5e3716245ef1c"
  mode 0644
end

dpkg_package 'logmail' do
  source logmail_local_cache
  action :install
end
