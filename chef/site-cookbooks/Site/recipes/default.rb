#
# Cookbook Name:: Site
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "disable-default-site" do
  command "a2dissite default"
end

web_app "site" do
  application_name "site-app"
  docroot "/vagrant/web"
end