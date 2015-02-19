require 'spec_helper'

describe 'maas::centos' do
  let(:runner) { ChefSpec::ServerRunner.new(UBUNTU_OPTS) }
  let(:node) { runner.node }

  let(:chef_run) do
    node.set['lsb']['codename'] = 'ubuntu'
    runner.converge(described_recipe)
  end

  it 'requires the bazaar cookbook' do
    expect(chef_run).to include_recipe('bazaar')
  end

  it 'execute installing dependancies' do
    expect(chef_run).to run_execute('installing dependancies')
  end

  it 'execute building centos7 image' do
    expect(chef_run).to run_execute('building centos70....this might take a while; coffee is your friend.') # rubocop:disable LineLength
  end

  it 'executes install to centos70 to MAAS' do
    expect(chef_run).to run_execute('install centos70 to MAAS')
  end

  it 'should install python packages' do
    expect(chef_run).to install_package('python-tempita')
    expect(chef_run).to install_package('python-yaml')
  end
end
