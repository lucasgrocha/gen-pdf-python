```shell
docker run -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_ROOT_HOST=% -p 3306:3306 -v mysql_data:/var/lib/mysql --name mysql -d mysql:latest
```

```shell
docker exec -i mysql mysql --default-character-set=utf8mb4 -u root < ./seeds.sql && echo "OK"
```

```shell
pip3 install -r requirements.txt
```

Via server

```shell
uvicorn server:app --reload
```

Via console

```shell
python3 main.py
```
