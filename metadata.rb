name 'maas'
maintainer 'Chef Partner Engineering'
maintainer_email 'partnereng@chef.io'
license 'Apache 2'
description 'Installs/Configures maas'
long_description 'Installs/Configures maas'
version '2.0.1'

supports 'ubuntu', '>= 14.04'

depends 'apt', '>= 2.6.1'

issues_url 'https://github.com/chef-partners/maas/issues' if respond_to?(:issues_url)
source_url 'https://github.com/chef-partners/maas' if respond_to?(:source_url)
