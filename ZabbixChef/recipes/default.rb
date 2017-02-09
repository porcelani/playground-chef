#
# Cookbook Name:: ZabbixServer
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install VIM 

yum_package "vim" do
	action :install
end

# Remove MySQL dependecy

yum_package "mysql-community-common" do
	action :remove
end

# Add MariaDB repository

rpm_package "mariadb" do
	source "http://yum.mariadb.org/10.1/centos7-amd64"
	action :install
end

# Add EPEL repository
yum_repository 'epel' do
	description 'Extra Packages for Enterprise Linux 7 - $basearch'
	mirrorlist 'https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch'
	gpgkey 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
	gpgcheck '1'
	enable '1'
	action :create
end

# Add IUS repository
yum_repository 'ius' do 
        description 'IUS Community Packages for Enterprise Linux 7 - $basearch'
        mirrorlist 'https://mirrors.iuscommunity.org/mirrorlist?repo=ius-centos7&arch=$basearch&protocol=http'
        gpgkey 'http://mirrors.kernel.org/ius/IUS-COMMUNITY-GPG-KEY'
	gpgcheck '1'
	enable '1'
        action :create
end

# Add Zabbix repository
yum_repository 'zabbix' do  
        description 'Zabbix Official Repository - $basearch'
        baseurl 'http://repo.zabbix.com/zabbix/3.0/rhel/7/$basearch/'
        gpgkey 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX'
	gpgcheck '1'
	enable '1'
        action :create
end

# Install mariadb-server package
yum_package 'mariadb-server' do
	action :install
end

# Install Apache 2.4 
yum_package 'httpd24u' do
	action :install

end

# Install PHP
yum_package ['php56u', 'php56u-opcache'] do
	action :install
end

# Install Zabbix Server
yum_package 'zabbix-server-mysql' do
	action :install
end

# Install Zabbix Web Database
yum_package 'zabbix-web-mysql' do
	action :install
end

# Install Zabbix Agent
yum_package 'zabbix-agent' do
	action :install
end

# Start MariaDB








