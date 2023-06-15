# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hboumahd <hboumahd@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/10 11:39:26 by hboumahd          #+#    #+#              #
#    Updated: 2023/06/15 12:42:59 by hboumahd         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml
MY_VOLUMES = $(shell docker volume ls -q)


all : up

up : 
	@mkdir -p ~/hboumahd/data/mariadb
	@mkdir -p ~/hboumahd/data/wordpress
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -d

build : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} build 	
	
down : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} down

start : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} start

stop : 
	@${COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop

logs:
	$(COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

clean: down
	@docker system prune -af
	@docker volume rm $(MY_VOLUMES)
	@rm -rf ~/hboumahd/data/mariadb
	@rm -rf ~/hboumahd/data/wordpress

re: clean all
	
	
.PHONY: build up down start stop clean re