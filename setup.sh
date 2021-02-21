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
                                                                                  \n\n\033[1;0"
if [ $1 = '1' ]; then
    minikube delete 
fi;

print_green "starting minikube"
minikube start --cpus=4 --memory='4g'

print_green "enable minikube dashbord"
enable_addons dashbord
minikube dashbord &

print_green "menable minikube metallb"
enable_addons  metallb

print_green "docker env"
eval $(minikube docker-env)

print_green "build edge-service  image"
docker build ./src/edge_service -t edge-service
print_green "configure loadBlancer"
LIP=${IP%.*}.200
sed -i -e "s/MINIKUBIP/$LIP/g" ./src/loadBalancer/metallb-config.yaml
sed -i -e "s/TOCHANGE_IP/$LIP/g" ./src/edge_service/srcs/nginx.conf

IP=`minikube ip`

printf $IP



kubectl apply -f ./src/loadBalancer/metallb-config.yaml

print_green "deploy edge_service"

kubectl apply -f ./src/edge_service/yaml/



# reconfig metallb-config to MINIKUBEIP
sed -i -e "s/$LIP/MINIKUBIP/g" ./src/loadBalancer/metallb-config.yaml

sed -i -e "s/$LIP/TOCHANGE_IP/g" ./src/edge_service/srcs/nginx.conf
