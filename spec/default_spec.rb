require 'spec_helper'

describe 'maas::default' do
  let(:runner) { ChefSpec::ServerRunner.new(UBUNTU_OPTS) }
  let(:node) { runner.node }

  let(:chef_run) do
    node.set['lsb']['codename'] = 'ubuntu'
    runner.converge(described_recipe)
  end

  it 'requires the apt cookbook' do
    expect(chef_run).to include_recipe('apt')
  end

  it 'installs maas' do
    expect(chef_run).to install_package('maas')
  end

  it 'installs maas-dhcp' do
    expect(chef_run).to install_package('maas-dhcp')
  end

  it 'installs maas-dns' do
    expect(chef_run).to install_package('maas-dns')
  end
end
