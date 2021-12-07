image_version=`date +%Y%m%d%H%M`;
echo $image_version;
# cd docker_demo;
git pull --rebase origin master;
# npm install;
# npm run build;
docker stop docker_demo;
docker rm docker_demo;
docker build . -t docker_demo:$image_version;
docker images;
docker run -p 3000:80 -d --name docker_demo docker_demo:$image_version;
docker logs docker_demo;
docker rmi $(docker images -f "dangling=true" -q)