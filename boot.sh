#!/usr/bin/env bash
cd /var/discourse
for i in {1..50}; do ping -c1 www.google.com && break; done
./launcher app
/sbin/boot
