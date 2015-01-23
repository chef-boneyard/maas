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

## Testing

There are chefspec tests which you can run via chef-dk.
```bash
$ chef exec rspec spec
```

There is also kitchen integration tests that you can run via chef-dk.
```bash
$ chef exec kitchen test
```
