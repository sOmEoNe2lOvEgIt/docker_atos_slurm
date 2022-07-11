echo -e "\033[0;31m"
docker rm  $(docker stop $(docker ps -a -q --filter ancestor="head" --format="{{.ID}}"))
docker image rm -f head
echo -e "\033[0;32m###########_Building image_###########\033[0;0m"
docker build -t head .