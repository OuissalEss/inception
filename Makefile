NAME = Inception

all: $(NAME)



$(NAME):
	mkdir -p /home/oessamdi/data/vl_wp
	mkdir -p /home/oessamdi/data/vl_db
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
		docker-compose -f ./srcs/docker-compose.yml down

restart:
		docker-compose -f ./srcs/docker-compose.yml restart

prune:
		docker system prune -a -f
		docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

clean:
	rm -rf /home/oessamdi/data/vl_wp
	rm -rf /home/oessamdi/data/vl_db
	rm -rf /home/oessamdi/data

fclean: prune clean

re: fclean all
