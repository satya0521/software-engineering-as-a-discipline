# MySQL Binary Log Replication

## Checking replication with mysqlbinlog utility

```bash
# bring up two hosts
# one with mysql
# another test host with mysqlbinlog utility
docker-compose up -d

# check the container status
docker-compose ps

# access bash of test_host and start reading binlog of mysql_host
docker-compose exec test_host bash
    ls /tmp
    # password is root; shell will not prompt after correct password
    mysqlbinlog --read-from-remote-server \
        --host mysql_host \
        --port 3306 \
        --user root \
        --password \
        --raw \
        --result-file=/tmp/ \
        --stop-never \
        binlog.000002

# access bash of test_host and tail the binlog updates
docker-compose exec test_host bash
    ls /tmp
    tail -100f /tmp/binlog.000002

# access bash of mysql_host
docker-compose exec mysql_host bash
    ls /var/lib/mysql # this is where the binlogs are stored
    mysqlbinlog /var/lib/mysql/binlog.000002
    mysql -u root -proot -e 'SHOW BINARY LOGS' # command to know the binlogs
    mysql -u root -proot -e 'CREATE DATABASE test_db_1'

# bring the containers down
docker-compose down
```

## MySQL Binary Log Requirements

[SQL](./mysql_binlog_requirements.sql) for checking database configuration against desired configuration
