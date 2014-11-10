#
# Cookbook Name:: gitsetup
# Recipe:: proxy
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"

bash "proxy" do
  not_if "cat #{node['gitsetup']['home']}/.gitconfig"

  user "#{node['gitsetup']['user']}"
  environment "HOME" => "#{node['gitsetup']['home']}"
  code <<-EOS
  git config --global url."https://".insteadOf git://
  EOS
  action :run
end

