#!/bin/sh

echo " $(/usr/sbin/ifconfig enp8s0 | grep "inet " | awk '{print $2}')"
