#
# Cookbook Name:: padrao_so
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'mysql-community-common' do
  action :remove
end

  execute 'altera_timezone' do
    Chef::Log.info("altera_timezone")
    user 'root'
    command "ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime"
    action :run
  end

package 'vim-enhanced' do
  action :install
end

#  execute 'limpa_iptables' do
#    Chef::Log.info("Limpa iptables")
#    user 'root'
#    command "iptables -F ; /etc/init.d/iptables save;"
#    action :run
#  end
