echo -e "\033[0;31m"
docker rm  $(docker stop $(docker ps -a -q --filter ancestor="slurm_head" --format="{{.ID}}"))
docker image rm -f slurm_head
echo -e "\033[0;32m###########_Building image_###########\033[0;0m"
docker build -t slurm_head .