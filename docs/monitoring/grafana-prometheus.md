# Monitoring: Grafana, Prometheus and Node Exporter
Containerized monitoring solution built using docker (docker compose). The stack collects OS and hardware metrics using **Node Exporter**, stores data using **Prometheus**, and visualizes metrics using **Grafana**.

---

## Configuration Files
[Grafana]
[Prometheus]
[Node Exporter]

### File Structure
```
services
├─ grafana
│    └── docker-compose.yml
├─ prometheus
│      ├─ docker-compose.yml
│  prometheus
│      └── prometheus.yml
└─ node-exporter
        └── docker-compose.yml
```

## Starting the stack
For each directory containing `docker-compose.yml`
```
docker compose up -d
```

## Accessing Web Interfaces

| Service | URL |
| :--- | :--- |
| **Grafana**| `http://HOST_IP:3000`| 
| **Prometheus** | `http://HOST_IP:9090` |

## Configuring Grafana
1. Log into grafana: `http://HOST_IP:3000`
2. Add Prometheus as data Source:
    * Connections -> Data Sources -> Add data source -> Prometheus
    * Set URL to `http://HOST_IP:9090`
    * Save & Test
3. Import or create your own dashboard