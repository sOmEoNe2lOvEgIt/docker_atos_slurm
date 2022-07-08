docker stop slurm_head
docker rm slurm_head
docker run --name="slurm_head" --hostname="slurm_controller_daemon" --network slurm-network -v /home/slurm_head_docker/etc/slurm_conf:/etc/slurm head