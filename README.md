docker-vagrant-libvirt
======================

A docker container for vagrant-libvirt

Build
=====
docker build -t vagrant_libvirt:latest .


Run
===
docker run --rm --privileged=true -v /var/run/libvirt:/var/run/libvirt -v /var/lib/ctr-vagrant-libvirt:/persistent-data -ti vagrant_libvirt


Notes
=====
* This container has to run priviledged so that it can communicate with the libvirt socket

* This container uses /persistent-data to store vagrant box images, and other persistent data. The command above uses /var/lib/ctr-vagrant-libvirt as the persistent directory, but any directory can be used.

* Libvirt must still be setup on the host machine. See the section "KVM/QEMU installation" from here: https://ttboj.wordpress.com/2014/05/13/vagrant-on-fedora-with-libvirt-reprise/

* Only tested on Fedora 20 x86_64, but may work elsewhere
