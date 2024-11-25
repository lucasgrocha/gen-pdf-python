docker run -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_ROOT_HOST=% -p 3306:3306 -v mysql_data:/var/lib/mysql --name mysql -d mysql:latest

docker container exec -i mysql mysql -u root < ./seeds.sql
