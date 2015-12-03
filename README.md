# maas
[![Build Status](https://travis-ci.org/chef-partners/maas.svg?branch=master)](https://travis-ci.org/chef-partners/maas)

This is a cookbook to deploy [maas](https://maas.ubuntu.com) via chef.

It requires the [`apt`](https://supermarket.chef.io/cookbooks/apt) cookbook.

Ubuntu 14.04 is the only supported distro and version.

After it has converged successfully, you should follow the steps [installing maas](https://maas.ubuntu.com/docs/install.html).

The `default.rb` will install the default installation of MAAS. While the `clustercontroller` will only build you a [cluster controller](https://maas.ubuntu.com/docs/install.html#adding-cluster-controllers).

## Attributes

You will want to changes these attributes around, these are the defaults.

Create the Superuser
```ruby
default['maas']['create_superuser'] = true
```

Superuser name
```ruby
default['maas']['superuser_name'] = "admin"
```

Superuser password
```ruby
default['maas']['superuser_password'] = "admin"
```

Superuser email
```ruby
default['maas']['superuser_email'] = "fakeemail@fake.com"
```

The secret for your cluster controller, whatever is on your region controller.
```ruby
default['maas']['cluster_secret'] = 'f0a6035342ed1651f822d26fe1ed0109'
```

Your region controller, just ip or hostname
```ruby
default['maas']['cluster_region_controller'] = '127.0.0.1'
```

## Adding another nic after provisioning

If you and another network interface card after your initial provisioning you will have to do the following:
```bash
$ sudo dpkg-reconfigure maas-cluster-controller
$ sudo dpkg-reconfigure maas-region-controller
```
And make sure they are the address on the network you want to have MaaS provision.

## Testing

There are chefspec tests which you can run via chef-dk.
```bash
$ chef exec rspec spec
```

There is also kitchen integration tests that you can run via chef-dk.
```bash
$ chef exec kitchen test
```
