# Create the Superuser
default['maas']['create_superuser'] = true

# Superuser name
default['maas']['superuser_name'] = 'admin'
# Superuser password
default['maas']['superuser_password'] = 'admin'
# Superuser email
default['maas']['superuser_email'] = 'fakeemail@fake.com'

# secret for your cluster controller
default['maas']['cluster_secret'] = 'f0a6035342ed1651f822d26fe1ed0109'

# your region controller, just ip or hostname
default['maas']['cluster_region_controller'] = '127.0.0.1'
