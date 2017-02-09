#
# Cookbook Name:: mariadb
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/yum.repos.d/mariadb.repo' do
  source 'mariadb.repo'
  mode 00644
end

package "MariaDB-server" do
  action :install
end
