#
# Cookbook Name:: padrao_so
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "php-fpm" do
  action :install
end

template '/etc/php-fpm.d/www.conf' do
  source 'www.conf'
end

service "php-fpm" do
  action [ :enable, :start ]
end
