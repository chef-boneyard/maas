require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'
require 'chef/application'

LOG_LEVEL = :fatal

# rubocop:disable all
UBUNTU_OPTS = {
  :platform => 'ubuntu',
  :version => '14.04',
  :log_level => LOG_LEVEL
}
# rubocop:enable all

at_exit { ChefSpec::Coverage.report! }
