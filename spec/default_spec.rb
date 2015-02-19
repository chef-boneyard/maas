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

  it 'should run the superuser setup' do
    expect(chef_run).to run_execute('Setup Superuser')
  end

  describe 'superuser set to false' do
    let(:chef_run) do
      node.set['maas']['create_superuser'] = false
      runner.converge(described_recipe)
    end

    it 'should not setup the superuser' do
      expect(chef_run).to_not run_execute('Setup Superuser')
    end
  end
end
