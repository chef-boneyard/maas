#
# Cookbook Name:: maas
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

apt_repository 'MAASTesting' do
  uri 'ppa:maas-maintainers/testing'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key '93EE8CC5'
end

%w(maas maas-dhcp maas-dns).each do |pkg|
  package pkg do
    action [:install]
  end
end

if node['maas']['create_superuser']
  execute 'Setup Superuser' do
    command "maas-region-admin createadmin --username=#{node['maas']['superuser_name']} --password=#{node['maas']['superuser_password']} --email #{node['maas']['superuser_password']} && touch /etc/maas/.superuser_created"
    creates '/etc/maas/.superuser_created'
    action :run
  end
end
