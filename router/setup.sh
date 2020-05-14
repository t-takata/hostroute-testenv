#!/bin/bash
CFG=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

$CFG begin
$CFG set protocols static route 198.51.100.10/32 next-hop 100.64.0.10
$CFG commit
$CFG end
#configure
#set protocols static route 198.51.100.10/32 next-hop 100.64.0.10
#commit
