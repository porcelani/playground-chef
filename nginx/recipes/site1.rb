#
# Cookbook Name:: nginx
# Recipe:: site1
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# Site 1 faz xpto ABC 123

template '/etc/nginx/conf.d/site1.conf' do
  source 'site1.conf'
  mode 00644
end

service "nginx" do
  action :start
end
