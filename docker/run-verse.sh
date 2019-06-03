PATH_TO_PROJECT=$1

## echo "docker pull ssinari/rockers-verse:1.0 && \
##       docker run --rm \
##         -e PASSWORD=rstudio \
##         -e USERID=$(id -g $(whoami)) \
##         -p 8787:8787 \
##         -v ${PATH_TO_PROJECT}:/home/rstudio/project \
##         ssinari/verse:1.0" \
docker pull ssinari/rockers-base:1.0 && \
    docker run --rm \
           -v ${PATH_TO_PROJECT}:/home/rstudio/project \
           -it ssinari/rockers-base:1.0 

