# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hboumahd <hboumahd@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/10 11:39:26 by hboumahd          #+#    #+#              #
#    Updated: 2023/06/10 12:15:16 by hboumahd         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all : ${up}

up : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} up 

down : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} down

start : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} start

stop : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop

clean: down
	@docker system prune -af
	
.PHONY: up down build start stop