

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

execute 'installing dependancies' do
  command 'sudo ./bin/build centos amd64 --centos-edition 7'
  creates '/tmp/something'

  action :run
end
