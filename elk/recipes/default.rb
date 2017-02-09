#
# Cookbook Name:: elk
# Recipe:: default
#

## install ELASTICSEARCH and configure to use tmp for data storage

include_recipe 'chef-sugar'
include_recipe 'java'
include_recipe 'elasticsearch'

package 'vim'
elasticsearch_install 'elasticsearch'