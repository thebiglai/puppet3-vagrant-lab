#!/bin/bash

# Pre-Puppet provisioning script ot update to latest vendor release
# This script assumes CentOS 6.x
set -e

iptables -t filter -I INPUT 1 -p tcp --dport 8081 -j ACCEPT

# Install EPEL
rpm -Uvh \
http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm \
2>/dev/null

# Install PuppetLabs' yum repositories
rpm -Uvh \
http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm \
2>/dev/null

# Maybe you want to use the latest vendor relase of Puppet?
yum -y -q update puppet 2>/dev/null

