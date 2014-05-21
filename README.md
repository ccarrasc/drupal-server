drupal-server
==============

The provision script installs Drupal 7 on an Ubuntu 12.04 LTS server running LAMP.

## First Install/Run:
* Install [VirtualBox][virtualbox.url]
* Install [Vagrant][vagrant.url]
* Clone this project
* Start up the VM with vagrant

```bash
  $ vagrant up
```
* Wait for the box to download (Ubuntu) and the VM to be provisioned
* ssh into the VM by executing: `$ vagrant ssh`
* Browse to [http://192.168.100.10/install.php][localhost.url] from your host machine when installation is complete.

The Server's root user and password are both 'vagrant'
This creates a database named 'drupal-db' with only the root user who's password is also 'vagrant'.
As this is meant for local dev and playing around with, security is not a concern :)

## Stop/Halt the VM:

```bash
  $ vagrant halt
```

[virtualbox.url]:https://www.virtualbox.org/
[vagrant.url]:http://www.vagrantup.com/
[localhost.url]:http://192.168.100.10/install.php

