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

  it 'runs a execute setup Superuser' do
    expect(chef_run).to run_execute('Setup Superuser')
  end
end

describe 'maas::clustercontroller' do
  let(:runner) { ChefSpec::ServerRunner.new(UBUNTU_OPTS) }
  let(:node) { runner.node }

  let(:chef_run) do
    node.set['lsb']['codename'] = 'ubuntu'
    runner.converge(described_recipe)
  end

  it 'requires the apt cookbook' do
    expect(chef_run).to include_recipe('apt')
  end

  it 'installs maas-cluster-controller' do
    expect(chef_run).to install_package('maas-cluster-controller')
  end

  it 'creates a secret file' do
    expect(chef_run).to create_file('/var/lib/maas/secret')
  end

  it 'runs a execute maas-provision check' do
    expect(chef_run).to run_execute('maas-provision check-for-shared-secret')
  end

  it 'runs a execute maas-provision maas-url' do
    expect(chef_run).to run_execute('maas-provision')
  end
end
