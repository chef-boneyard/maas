require 'spec_helper'

describe host('www.google.com') do
  it { should be_reachable }
end

describe file('/var/lib/maas/secret') do
  it { should be_file }
end

describe file('/etc/maas/.maas_provision') do
  it { should be_file }
end

describe file('/etc/maas/pserv.yaml') do
  it { should be_file }
end
