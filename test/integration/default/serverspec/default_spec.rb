require 'spec_helper'

describe host('www.google.com') do
  it { should be_reachable }
end

describe port(80) do
  it { should be_listening }
end

describe service('apache2') do
  it { should be_enabled }
end

describe service('postgres') do
  it { should be_enabled }
end

describe service('squid3') do
  it { should be_enabled }
end

describe service('maas-proxy') do
  it { should be_enabled }
end
