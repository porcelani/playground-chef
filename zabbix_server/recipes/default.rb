#
# Cookbook Name:: zabbix_server
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/yum.repos.d/zabbix.repo' do
  source 'zabbix.repo'
  mode 00644
end


