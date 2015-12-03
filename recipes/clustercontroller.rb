#
# Cookbook Name:: maas
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

apt_repository 'mass-stable' do
  uri 'ppa:maas/stable'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key '684D4A1C'
end

%w(maas-cluster-controller).each do |pkg|
  package pkg do
    action [:install]
  end
end

file '/var/lib/maas/secret' do
  owner 'root'
  group 'root'
  mode '0644'
  content node['maas']['cluster_secret']
  action :create
end

execute 'maas-provision check-for-shared-secret' do
  command 'maas-provision check-for-shared-secret && touch /etc/maas/.maas_provision_check-for-shared-secret'
  creates '/etc/maas/.maas_provision_check-for-shared-secret'
  action :run
end

execute 'maas-provision' do
  command "maas-provision configure-maas-url http://#{node['maas']['cluster_region_controller']}/MAAS && touch /etc/maas/.maas_provision"
  creates '/etc/maas/.maas_provision'
  action :run
end
