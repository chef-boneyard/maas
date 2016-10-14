require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'
require 'chef/application'

LOG_LEVEL = :fatal

UBUNTU_OPTS = {
  :platform => 'ubuntu',
  :version => '14.04',
  :log_level => LOG_LEVEL
}.freeze

at_exit { ChefSpec::Coverage.report! }
