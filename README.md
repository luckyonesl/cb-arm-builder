# cb-arm-builder

the intention of the repo is to build a codebeamer arm image.
It's not intended to have phontomjs working

## run codebeamer

specify the version tag of [codebeamer](https://hub.docker.com/r/intland/codebeamer/tags)

```bash
docker-compose build --build-arg CB_VER=21.09-SP14
docker-compose up -d
docker-compose logs -f
```

## usefull snipets

```bash
mysqldump -uuser -ppass codebeamer --no-create-db --single-transaction --routines --default-character-set=utf8 --result-file=/tmp/cb.dump
```

```bash
create database codebeamer;
alter database codebeamer character set utf8mb4 collate utf8mb4_general_ci;
```

stop db

```bash
kill -TERM `ps -Cmysqld -opid=`
```
