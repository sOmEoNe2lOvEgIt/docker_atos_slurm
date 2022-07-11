echo -e "\033[0;31m"
docker rm  $(docker stop $(docker ps -a -q --filter ancestor="head" --format="{{.ID}}"))
echo -e "\033[0;32m###########_Starting head (slurmctl) container_###########\033[0;0m"
docker run --name="slurm_head" --hostname="slurm_controller_daemon" --network slurm-network -v /home/slurm_head_docker/etc/slurm_conf:/etc/slurm head