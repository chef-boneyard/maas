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

%w(maas).each do |pkg|
  package pkg do
    action [:install]
  end
end

if node['maas']['create_superuser']
  execute 'Setup Superuser' do
    command "maas-region-admin createadmin --username=#{node['maas']['superuser_name']} --password=#{node['maas']['superuser_password']} --email #{node['maas']['superuser_email']} && touch /etc/maas/.superuser_created" # rubocop:disable LineLength
    creates '/etc/maas/.superuser_created'
    action :run
  end
end
