#
# Cookbook Name:: elk
# Recipe:: default
#

## install ELASTICSEARCH and configure to use tmp for data storage

include_recipe 'java'

package 'vim'

ENV['ES_JAVA_OPTS'] = '-Xms1g -Xmx1g'

remote_file "#{Chef::Config[:file_cache_path]}/elasticsearch-5.2.0.rpm" do
  source "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.2.0.rpm"
  action :create
end

rpm_package "elasticsearch" do
  source "#{Chef::Config[:file_cache_path]}/elasticsearch-5.2.0.rpm"
  action :install
end

file '/etc/elasticsearch/elasticsearch.yml' do
  content 'network.host: 0.0.0.0'
end

service "elasticsearch" do
  action :start
end