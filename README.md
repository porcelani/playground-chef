# Chef Playground

## Start Chef: Simple start to understand
https://chefiseasy.com/2014/02/24/chapter-01


## Kitchen: Let's work
install ChefDK
chef generate cookbook my_machine

kitchen create       //Commands in cascade
kitchen converge
kitchen test

kitchen list //List all machines
kitchen login  //login in machine

## Cookbooks: Use a cookbook in your recipe
http://stackoverflow.com/questions/29374389/how-to-use-chef-to-install-jdk8-on-rhel?rq=1

## Resources: How you command the Chef
https://docs.chef.io/resource.html

The recipes have resources. A resource is a Ruby block with four components: a type <directory>, a name </tmp/folder>,
one (or more) properties <owner, group and mode> (with values), and one (or more) actions.
All the resources hava a default values to you propertis and action.

directory '/tmp/folder' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service 'apache' do
  supports :restart => true, :reload => true
  action :enable
end


