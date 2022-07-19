#!/bin/sh
chown 999 /etc/munge/munge.key
su -s /bin/bash -c "munged --key-file /etc/munge/munge.key" munge
nc -4 -l 6818
nc –listen –source-port 6818
slurmctld -D