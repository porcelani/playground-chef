#
# Cookbook Name:: logstash-forwarder
# Recipe:: default
# Author:: Pavel Yudin <pyudin@parallels.com>
#
# Copyright (c) 2015, Parallels IP Holdings GmbH
#
#

if platform_family?('ubuntu', 'debian')

  execute 'adicionando repositorios logstash-forward' do
    Chef::Log.info("adicionando repositorios logstash-forward")
    user 'root'
    command " echo 'deb http://packages.elasticsearch.org/logstashforwarder/debian stable main' | tee /etc/apt/sources.list.d/logstashforwarder.list ; wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - ; apt-get update -y ; apt-get install logstash-forwarder -y"
    action :run
  end

else
	 bash "adiciona_chave_repo_logstash_forward" do
	      action :nothing
	      code <<-EOH
		sudo rpm --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch
	      EOH
	    end

	template '/etc/yum.repos.d/logstash-forward.repo' do
	  source 'logstash-forward.repo'
	    mode '0600'
	    owner 'root'
	    group 'root'
	end

package "logstash-forwarder" do
  action :install
end

end

directory "/etc/pki/tls/certs" do
  owner "nginx"
  group "nginx"
  mode 00755
  recursive true
  action :create
end

template '/etc/pki/tls/certs/logstash-forwarder.crt' do
  source 'logstash-forwarder.crt'
end

template node['logstash-forwarder']['config_path'] do
  source 'forwarder.conf.erb'
end

service "logstash-forwarder" do
  action [ :enable, :restart ]
end
