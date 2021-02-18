#!/bin/bash
enable_addons()
{
    minikube addons enable $1
}

print_green()
{
    printf "\n\n\033[1;32m $1 \n \033[1;20m " 
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
print_green "starting minikube"
minikube start
print_green "enable minikube dashbord"
enable_addons dashbord


print_green "menable minikube metallb"
enable_addons  metallb
minikube addons configure metallb 

