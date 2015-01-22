#
# Cookbook Name:: maas
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

%w{maas maas-dhcp maas-dns}.each do |pkg|
  package pkg do
    action [:install]
  end
end
