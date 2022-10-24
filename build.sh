echo -e "\033[0;31m"
docker rm  $(docker stop $(docker ps -a -q --filter ancestor="slurm_controller" --format="{{.ID}}"))
docker image rm -f slurm_controller
echo -e "\033[0;32m###########_Building image_###########\033[0;0m"
docker build -t slurm_controller .
