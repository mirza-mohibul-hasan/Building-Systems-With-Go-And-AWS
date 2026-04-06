#!/bin/bash

ip netns del ns1 2>/dev/null
ip netns del ns2 2>/dev/null
ip netns del router-ns 2>/dev/null

ip link del br0 2>/dev/null
ip link del br1 2>/dev/null

echo "cleanup completed"
