docker rm $(docker stop $(docker ps -a -q --filter ancestor="head" --format="{{.ID}}")) &
docker image rm head &
docker build -t head ./head