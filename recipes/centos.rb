
include_recipe 'bazaar'

bazaar 'maas-image-builder' do
  source 'lp'
  user 'maas-maintainers'
  remote_path 'maas/maas-image-builder'
  local_path '/opt/'
end

%w(python-tempita python-yaml).each do |pkg|
  package pkg do
    action [:install]
  end
end

execute 'installing dependancies' do
  command 'sudo ./bin/build --install-deps && touch /etc/maas/.image_deps_installed' # rubocop:disable LineLength
  creates '/etc/maas/.image_deps_installed'
  action :run
end

execute 'building centos70....this might take a while; coffee is your friend.' do # rubocop:disable LineLength
  command 'sudo ./bin/build centos amd64 --centos-edition 7'
  creates '/etc/libvirt/qemu/img-build-centos7-amd64.xml'
  action :run
end

execute 'install centos70 to MAAS' do
  command 'maas admin boot-resources create name=centos/centos70 architecture=amd64/generic content@=/opt/maas-image-builder/build-output/centos7-amd64-root-tgz && touch /etc/maas/.installed_centos70' # rubocop:disable LineLength
  creates '/etc/maas/.installed_centos70'
  action :run
end
