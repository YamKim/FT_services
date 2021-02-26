#!/bin/bash
enable_addons()
{
    minikube addons enable $1
}

print_green()
{
    printf "\n\n____________\033[1;32m $1  \033[1;0m ____________\n " 
}

clear
echo -ne 	"\n\n\033[1;31m
███████╗████████╗     ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗███████╗
██╔════╝╚══██╔══╝     ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝██╔════╝
█████╗     ██║        ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  ███████╗
██╔══╝     ██║        ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  ╚════██║
██║        ██║███████╗███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗███████║
╚═╝        ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝╚══════╝
								(by aait-ham)
                                                                                  \n\n\033[1;0m"
if [ $1 = '1' ]; then
    minikube delete 
fi;

print_green "starting minikube"
minikube start --cpus=4 --memory='4g'

print_green "enable minikube dashbord"
enable_addons dashboard


print_green "menable minikube metallb"
enable_addons  metallb

print_green "docker env"
eval $(minikube docker-env)
print_green "login to dockerhub"
echo "Abdelait12." | docker login -u b0n3 --password-stdin 


print_green "configure loadBlancer"
IP=`minikube ip`
LIP=${IP%.*}.200
echo $LIP
sed -i -e "s/MINIKUBIP/$LIP/g" ./src/loadBalancer/metallb-config.yaml
sed -i -e "s/TOCHANGE_IP/$LIP/g" ./src/edge_service/srcs/nginx.conf
sed -i -e "s/TOCHANGE_IP/$LIP/g" ./src/ftps/src/ftps.conf
printf $IP
cat ./src/loadBalancer/metallb-config.yaml

kubectl apply -f ./src/loadBalancer/metallb-config.yaml

print_green "build edge-service  image"
docker build ./src/edge_service -t edge-image
print_green "build mysql-db-service  image"
docker build ./src/db/ -t mysql-db-image

print_green "build wordpress image"
docker build --build-arg IP=$LIP ./src/wordpress/ -t wordpress-image

print_green "build php my admin  image"
docker build ./src/pma -t php-my-admin-image 

print_green "build  influxdb image"
docker build ./src/influxdb/ -t influxdb-image

print_green "build grafana image"
docker build ./src/grafana/ -t grafana-image
print_green "build ftps image"
docker build ./src/ftps/ -t ftps-image

print_green "deploy edge_service"

kubectl apply -f ./src/edge_service/yaml/

print_green "deploy db"
kubectl apply -f ./src/db/yaml/

print_green "deploy wordpress"
kubectl apply -f ./src/wordpress/yaml/

print_green "deploy php my admin"
kubectl apply -f src/pma/yaml

print_green "deploy influxdb"
kubectl apply -f ./src/influxdb/yaml 

print_green "deploy grafana"
kubectl apply -f ./src/grafana/yaml
print_green "deploy ftps"
kubectl apply -f ./src/ftps/yaml/
# change config  files to MINIKUBEIP
sed -i -e "s/$LIP/MINIKUBIP/g" ./src/loadBalancer/metallb-config.yaml

sed -i -e "s/$LIP/TOCHANGE_IP/g" ./src/edge_service/srcs/nginx.conf
 sed -i -e "s/$LIP/TOCHANGE_IP/g"     ./src/ftps/src/ftps.conf

minikube dashboard &
