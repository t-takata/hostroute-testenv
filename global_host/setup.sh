#!/bin/bash

systemctl disable NetworkManager.service
systemctl stop NetworkManager.service

#/sbin/ip route delete default
cp -f /vagrant/global_host/config/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0
cp -f /vagrant/global_host/config/route-eth1 /etc/sysconfig/network-scripts/route-eth1
systemctl restart network
