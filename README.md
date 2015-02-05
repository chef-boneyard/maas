# maas
[![Build Status](https://travis-ci.org/jjasghar/maas.svg?branch=master)](https://travis-ci.org/jjasghar/maas)

This is a cookbook to deploy [maas](https://maas.ubuntu.com) via chef.

It requires the `apt` cookbook.

Ubuntu 14.04 is the only supported distro and version.

After it has converged successfully, you should follow the steps [installing maas](https://maas.ubuntu.com/docs/install.html).

You'll need to create a `superuser` for the maas instance:
```bash
$ sudo maas-region-admin createadmin --username=root --email=MYEMAIL@EXAMPLE.COM
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
