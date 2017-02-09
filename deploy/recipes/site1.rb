#
# Cookbook Name:: deploy
# Recipe:: site1
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# Site 1 faz xpto ABC 123

directory '/var/www/html/site1' do
  recursive true
  owner "nginx"
  group "nginx"
  mode 00777
  action :create
end

#Chaves do usuario de deploy

directory '/root/.ssh' do
  owner "root"
  group "root"
  mode 00700
  action :create
end

template '/root/.ssh/id_rsa' do
  source 'site1-id_rsa'
  mode 00600
  owner "root"
  group "root"
end

template '/root/.ssh/id_rsa.pub' do
  source 'site1-id_rsa.pub'
  mode 00644
  owner "root"
  group "root"
end

package "git" do
  action :install
end

  execute 'git_clone_site1' do
    Chef::Log.info("git clone site1")
    user 'root'
    command "cd /var/www/html/site1 ; git init ; git remote add origin git@bitbucket.org:db1ti/app-teste-php.git ; git pull origin master;" 
    action :run
  end

#template '/var/www/html/site1/index.php' do
#  source 'phpinfo.php'
#  mode 00644
#  owner "nginx"
#  group "nginx"
#end
