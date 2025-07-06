#!/bin/bash

docker exec kafka kafka-topics.sh --create --topic tickets --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1
docker exec kafka kafka-topics.sh --create --topic iot --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1
docker exec kafka kafka-topics.sh --create --topic cameras --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1
docker exec kafka kafka-topics.sh --create --topic loyalty --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1
