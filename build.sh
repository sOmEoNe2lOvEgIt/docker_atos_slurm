docker rm  $(docker stop $(docker ps -a -q --filter ancestor="head" --format="{{.ID}}"& )& ) &
docker image rm -f head &
docker build -t head .