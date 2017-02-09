#
# Cookbook Name:: padrao_so
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx.repo'
  mode 00644
end

package "nginx" do
  action :install
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

directory '/var/www/html' do
  recursive true
  owner "nginx"
  group "nginx"
  mode 00777
  action :create
end

#template '/etc/nginx/nginx.conf'
#  source 'nginx.conf'
#end

service "nginx" do
  action :enable
end
