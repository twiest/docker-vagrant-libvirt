docker-vagrant-libvirt
======================

A docker container for vagrant-libvirt. Basically, I put these instructions into a docker container (except I used the embedded vagrant ruby instead of rvm).

https://ttboj.wordpress.com/2014/05/13/vagrant-on-fedora-with-libvirt-reprise/

Build
=====
docker build -t vagrant_libvirt:latest .


Run
===
docker run --rm --privileged=true -v /var/lib/libvirt:/var/lib/libvirt -v /var/run/libvirt:/var/run/libvirt -v /var/lib/ctr-vagrant-libvirt:/persistent-data -ti vagrant_libvirt


Notes
=====
* This container has to run priviledged so that it can communicate with the libvirt socket

* Libvirt must still be setup on the host machine. See the section "KVM/QEMU installation" from here: https://ttboj.wordpress.com/2014/05/13/vagrant-on-fedora-with-libvirt-reprise/

* libvirt commands work inside the docker container. For example: virsh list --all

* This container uses /persistent-data to store vagrant box images, and other persistent data. The command above uses /var/lib/ctr-vagrant-libvirt as the persistent directory, but any directory can be used.

* Only tested on Fedora 20 x86_64, but may work elsewhere

* The current directory is the oh-my-vagrant check out, so 'vs' and other aliased vagrant commands work without having to change directories.

* You'll still need to import vagrant boxes with a command like this:
  vagrant box add http://file.example.com/vagrant/rhel-7.0/rhel-7.0.box --name rhel-7.0
