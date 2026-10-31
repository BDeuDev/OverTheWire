#!/bin/sh

mkdir -p /tmp/tetete

chmod 755 /tmp/tetete

cat /etc/bandit_pass/bandit24 > /tmp/tetete/password

chmod 644 /tmp/tetete/password
