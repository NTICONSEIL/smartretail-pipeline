
# 🚀 SmartRetail Big Data Pipeline

Un environnement Docker Compose léger simulant une architecture Big Data retail (NiFi, Kafka, Spark, MinIO, PostgreSQL, ELK, Prometheus, Grafana).

## 🌟 Services inclus

| Service | Port local | Description |
|---------|------------|-------------|
| NiFi | 8080 | Orchestration des flux |
| Kafka | 9092 | Broker messages temps réel |
| Zookeeper | 2181 | Coordination Kafka |
| Spark Master | 7077 | Traitement batch/stream |
| MinIO | 9000 / 9001 | Stockage S3-like |
| PostgreSQL | 5432 | Entrepôt analytique |
| Elasticsearch | 9200 | Indexation/logs |
| Kibana | 5601 | Visualisation logs |
| Prometheus | 9090 | Monitoring |
| Grafana | 3000 | Dashboards |

---

## 🚀 Démarrage

```bash
docker-compose up -d
./scripts/init_kafka_topics.sh
```

---

## 📝 Import NiFi template

- Interface NiFi : http://localhost:8080
- Menu Templates → Upload → `configs/SmartRetailIngestionFlow.xml`

---

## 📝 Scénario de test

### 1️⃣ Kafka — produire et consommer un message

Créer un topic :
```bash
docker exec smartretail-kafka-1 kafka-topics --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
```

Produire un message :
```bash
docker exec -i smartretail-kafka-1 kafka-console-producer --broker-list localhost:9092 --topic test-topic
```
Tape :
```
{"order":"12345","product":"banana","qty":10}
```
Puis **Ctrl+D** (ou **Ctrl+C** selon le terminal)

Consommer le message :
```bash
docker exec smartretail-kafka-1 kafka-console-consumer --bootstrap-server localhost:9092 --topic test-topic --from-beginning --max-messages 1
```

---

### 2️⃣ MinIO — uploader un fichier

- Va sur http://localhost:9000
- Login : `minio`, pass : `minio123`
- Crée un bucket `smartretail-data`
- Upload un fichier texte

---

### 3️⃣ Elasticsearch — indexer et lire un document

Indexer :
```bash
curl -X POST "localhost:9200/test-index/_doc/1" -H 'Content-Type: application/json' -d'
{
  "user": "SmartRetail",
  "message": "Hello ELK!"
}'
```

Lire :
```bash
curl -X GET "localhost:9200/test-index/_doc/1"
```

---

## 🛑 Arrêt

```bash
docker-compose down
```

---

## 🛠 Structure

```
/scripts : scripts utilitaires
/configs : configs Prometheus, NiFi
/nifi-templates : templates NiFi
```

---

## 📝 Licence

Ce projet est fourni à des fins pédagogiques. À adapter pour usage production.  
Licence recommandée : MIT (à compléter selon votre choix)

---

## 📌 TODO

- Ajouter cadvisor ou node-exporter pour monitoring conteneurs
- Préparer YAML K8s
- Ajouter un script automatisé des tests
