#!/bin/bash

echo "setting up Network Namespace lab..."

# cleanup first in case of previous runs
ip netns del ns1 2>/dev/null
ip netns del ns2 2>/dev/null
ip netns del router-ns 2>/dev/null

ip link del br0 2>/dev/null
ip link del br1 2>/dev/null

#create bridges
ip link add br0 type bridge
ip link add br1 type bridge

ip link set br0 up
ip link set br1 up

# create namespaces
ip netns add ns1
ip netns add ns2
ip netns add router-ns

#create veth pairs
ip link add veth-ns1 type veth peer name veth-br1
ip link add veth-ns2 type veth peer name veth-br2
ip link add veth-r1 type veth peer name veth-r1-br
ip link add veth-r2 type veth peer name veth-r2-br

# assign to namespaces
ip link set veth-ns1 netns ns1
ip link set veth-ns2 netns ns2
ip link set veth-r1 netns router-ns
ip link set veth-r2 netns router-ns

# attach to bridges
ip link set veth-br1 master br0
ip link set veth-r1-br master br0
ip link set veth-br2 master br1
ip link set veth-r2-br master br1

# bring up bridge interfaces
ip link set veth-br1 up
ip link set veth-br2 up
ip link set veth-r1-br up
ip link set veth-r2-br up

# bring up namespace interfaces
ip netns exec ns1 ip link set lo up
ip netns exec ns2 ip link set lo up
ip netns exec router-ns ip link set lo up

ip netns exec ns1 ip link set veth-ns1 up
ip netns exec ns2 ip link set veth-ns2 up
ip netns exec router-ns ip link set veth-r1 up
ip netns exec router-ns ip link set veth-r2 up

# Assign IPs
ip netns exec ns1 ip addr add 10.0.1.2/24 dev veth-ns1
ip netns exec ns2 ip addr add 10.0.2.2/24 dev veth-ns2
ip netns exec router-ns ip addr add 10.0.1.1/24 dev veth-r1
ip netns exec router-ns ip addr add 10.0.2.1/24 dev veth-r2

# Enable routing
ip netns exec router-ns sysctl -w net.ipv4.ip_forward=1

# allow forwarding
ip netns exec router-ns iptables -P FORWARD ACCEPT

# Disable bridge filtering
echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables 2>/dev/null
echo 0 > /proc/sys/net/bridge/bridge-nf-call-ip6tables 2>/dev/null

# Add routes
ip netns exec ns1 ip route add default via 10.0.1.1
ip netns exec ns2 ip route add default via 10.0.2.1

echo "setup completed!"
echo "test with: ip netns exec ns1 ping 10.0.2.2"