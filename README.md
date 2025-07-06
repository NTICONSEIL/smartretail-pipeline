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

## 🚀 Démarrage

```bash
docker-compose up -d
./scripts/init_kafka_topics.sh
```

## 📝 Import NiFi template

- Interface NiFi : http://localhost:8080
- Menu Templates → Upload → `configs/SmartRetailIngestionFlow.xml`

## 🛑 Arrêt

```bash
docker-compose down
```

## 🛠 Structure

```
/scripts : scripts utilitaires
/configs : configs Prometheus, NiFi
/nifi-templates : templates NiFi
```

## 📝 Licence

Ce projet est fourni à des fins pédagogiques. À adapter pour usage production.

## 📌 TODO

- Ajouter CI/CD (GitHub Actions)
- Ajouter cadvisor ou node-exporter pour monitoring conteneurs
- Préparer YAML K8s
