# Kafka Connect POC

```bash

# Bring up Zookeeper, Kafka and Kafka Connect; MySQL
export DEBEZIUM_VERSION=0.9
docker-compose up -d

# Kafka
docker-compose exec kafka bash

/kafka/bin/kafka-topics.sh --list --zookeeper zookeeper:2181

/kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server kafka:9092 \
    --from-beginning \
    --property print.key=true \
    --topic dbserver1.inventory.customers

# MySQL access
docker-compose exec mysql bash -c 'mysql -u $MYSQL_USER -p$MYSQL_PASSWORD inventory'

    ```sql
    USE inventory;

    SHOW TABLES;

    DESCRIBE customers;

    INSERT INTO customers
    VALUES (1006, 'Satyakiran', 'D', 'satya@example.com');

    UPDATE customers
    SET last_name = 'Duggina'
    WHERE id = 1006;

    DELETE FROM customers
    WHERE id = 1006;
    ```

# Bring everything down
docker-compose down
```
