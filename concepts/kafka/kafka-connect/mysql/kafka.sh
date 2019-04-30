#!/bin/bash

wget http://mirrors.ocf.berkeley.edu/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz
tar -xzf kafka_2.12-2.2.0.tgz
cd kafka_2.12-2.2.0 || exit

bin/zookeeper-server-start.sh config/zookeeper.properties

bin/kafka-server-start.sh config/server.properties

bin/kafka-topics.sh \
    --create \
    --bootstrap-server localhost:9092 \
    --replication-factor 1 \
    --partitions 1 \
    --topic test
bin/kafka-topics.sh --list \
    --bootstrap-server localhost:9092

bin/kafka-console-producer.sh \
    --broker-list localhost:9092 \
    --topic test

bin/kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --topic test \
    --from-beginning

cp config/server.properties config/server-1.properties
cp config/server.properties config/server-2.properties

# config/server-1.properties:
#     broker.id=1
#     listeners=PLAINTEXT://:9093
#     log.dirs=/tmp/kafka-logs-1
 
# config/server-2.properties:
#     broker.id=2
#     listeners=PLAINTEXT://:9094
#     log.dirs=/tmp/kafka-logs-2

bin/kafka-server-start.sh config/server-1.properties &
bin/kafka-server-start.sh config/server-2.properties &

bin/kafka-topics.sh \
    --create \
    --bootstrap-server localhost:9092 \
    --replication-factor 3 \
    --partitions 1 \
    --topic my-replicated-topic

bin/kafka-topics.sh \
    --describe \
    --bootstrap-server localhost:9092 \
    --topic my-replicated-topic

bin/kafka-topics.sh \
    --describe \
    --bootstrap-server localhost:9092 \
    --topic test

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-replicated-topic
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic my-replicated-topic
pgrep -f server-1.properties
kill -9 7564
bin/kafka-topics.sh --describe --bootstrap-server localhost:9092 --topic my-replicated-topic
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic my-replicated-topic

# 7 Use Kafka Connect to import/export data

echo -e 'foo\nbar' > test.txt

bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-source.properties config/connect-file-sink.properties

more test.sink.txt

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic connect-test --from-beginning

# Step 8: Use Kafka Streams to process data
