# Vagrant self-study

## Hashicorp Vagrant Getting Started

* https://learn.hashicorp.com/collections/vagrant/getting-started

### Getting Started (gs01)

```
vagrant init generic/alpine313

vagrant ssh

~$ ip addr show
~$ exit

vagrant status

vagrant halt

vagrant status

vagrant destroy

vagrant status
```

### Initialize a project directory

```
vagrant init ubuntu/focal64
```

Edit `Vagrantfile' generated:

```
pico Vagrantfile
```

### Vagrant boxes catalog

* https://app.vagrantup.com/boxes/search

### Boxes

```
vagrant box list

vagrant box add <name | url>

vagrant box remove <name>
```

### Sync folder (gs02)

```
vagrant up

touch ./file.on.host

echo "Text echoead on host" >> ./file.on.host

vagrant ssh

ls /vagrant

cat /vagrant/file.on.host

echo "Text echoead on box" >> /vagrant/file.on.host

exit

cat ./file.on.host

```



### Provision a virtual machine (gs03)

### Multiple virtual machine (gs06)

Vagrant file with programatic mode

### Alpine VM with multiple installs

