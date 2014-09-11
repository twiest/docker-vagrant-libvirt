FROM fedora:20

MAINTAINER Thomas Wiest <twiest@redhat.com>

# creature comforts
ADD bashrc /root/.bashrc

ENV CONTAINER docker
ENV USER root
ENV HOME /root
ENV TERM xterm

# Make sure everything is up to date
RUN yum update -y ; yum clean all

# Install all deps
RUN yum install -y patch libyaml-devel libffi-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel openssl-devel bzip2 automake libtool bison wget tree vim screen mtr nmap telnet tar git make bash-completion ; yum clean all

# Install vagrant
RUN yum install -y https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.rpm ; yum clean all

# Install vagrant-libvirt deps
RUN yum install -y libvirt-client libvirt-devel libxslt-devel libxml2-devel

# Setup to use the vagrant embedded ruby
RUN head -n -3 /opt/vagrant/bin/vagrant > /opt/vagrant/bin/ruby-env

# Install vagrant-libvirt itself
RUN vagrant plugin install --plugin-version 0.0.20 vagrant-libvirt

# clone oh-my-vagrant
RUN cd /root ; git clone https://github.com/purpleidea/oh-my-vagrant.git

# Get the vagrant helper aliases
RUN cd /root ; wget https://gist.githubusercontent.com/purpleidea/8071962/raw/ee27c56e66aafdcb9fd9760f123e7eda51a6a51e/.bashrc_vagrant.sh

# Container specific login settings
WORKDIR /root/oh-my-vagrant/vagrant
CMD ["/bin/bash"]
