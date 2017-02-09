#
# Cookbook Name:: deploy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# 

  execute 'rm_confirmacao_know_hosts' do
    Chef::Log.info("removendo confirmacao para know_hosts")
    user 'root'
    command "echo StrictHostKeyChecking=no >> /etc/ssh/ssh_config "
    action :run
  end
