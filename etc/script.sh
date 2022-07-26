#!/bin/sh
chmod 700 etc/munge/munge.key
chown 999 /etc/munge/munge.key
chown slurm /var/log/slurm/
mkdir /node_logs
chmod 700 /node_logs
su -s /bin/bash -c "munged --key-file /etc/munge/munge.key" munge
slurmctld -Dvvv