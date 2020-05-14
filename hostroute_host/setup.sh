#!/bin/bash

systemctl disable NetworkManager.service
systemctl stop NetworkManager.service

cp -f /vagrant/hostroute_host/config/80-sysctl-arp.conf /etc/sysctl.d
sysctl --system

#/sbin/ip route delete default
cp -f /vagrant/hostroute_host/config/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0
cp -f /vagrant/hostroute_host/config/ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-eth1
cp -f /vagrant/hostroute_host/config/route-eth1 /etc/sysconfig/network-scripts/route-eth1
systemctl restart network
