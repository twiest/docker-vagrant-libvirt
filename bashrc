# .bashrc

# User specific aliases and functions

alias ls='ls --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source the vagrant embedded ruby env if it exists
[ -f /opt/vagrant/bin/ruby-env ] && source /opt/vagrant/bin/ruby-env


# Setup the persistent data dir if it's empty
[ -d /persistent-data/vagrant.d ] || mv /root/.vagrant.d /persistent-data/vagrant.d
rm -rf /root/.vagrant.d
ln -s /persistent-data/vagrant.d /root/.vagrant.d

[ -d /persistent-data/oh-my-vagrant ] || mv /root/oh-my-vagrant /persistent-data/oh-my-vagrant
rm -rf /root/oh-my-vagrant
ln -s /persistent-data/oh-my-vagrant /root/oh-my-vagrant

# Fix CWD
pushd / &> /dev/null
popd &> /dev/null

# Source the vagrant embedded ruby env if it exists
[ -f /root/.bashrc_vagrant.sh ] && source /root/.bashrc_vagrant.sh

export PS1='[\u@ctr-vagrant-libvirt \W]\$ '
