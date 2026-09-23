
# Infrastructure Overview & Service Deployment (`moris`)

**Host System:** Ubuntu Server (`moris`)  
**Network / Tailscale:** `TAILSCALE_IP` | `TAILSCALE_DOMAIN`  
**Local Subnet Routing:** `192.168.0.0/24` 
**Primary GPU:** NVIDIA GeForce RTX 2060 
**Storage Architecture:**
* **NVMe SSD (`/`):** Host OS, Docker Engine runtime, core configs (`~/services/`).
* **4 TB HDD (`/mnt/hdd`):** Persistent application storage, Docker volumes, and AI model weights.

---

## Global Port & Service Matrix

| Service | Host Port | Container Port | Status | Protocol / Path |
| :--- | :--- | :--- | :--- | :--- |
| **Ollama** | `11434` | `11434` | Active | HTTP / REST (`/api/generate`) |
| **Faster-Whisper** | `9000` | `8000` | Active | HTTP / REST (`/v1/audio/transcriptions`) |
| **Uptime Kuma** | `3001` | `3001` | Active | HTTP / Dashboard |
| **Grafana** | `3000` | `3000` | Active | HTTP / Dashboard |
| **Prometheus** | `9090` | `9090` | Active | HTTP / Web UI & REST (`/metrics`) |
| **Node Exporter** | `9100` | `9100` | Active | HTTP / Metrics (`/metrics`) |
| **Valheim Server** | `2456` & `2457` | `2456` & `2457` | Active | UDP (`2456`) and Steam Query (`2457`)|
---

## Directory & Mount Point Layout
(Needs to be updated)

```text
/
├── (NVMe SSD Root)
│   └── home/YOUR_USER/
│       ├── services/
│       │   ├── ollama/
│       │   │   └── docker-compose.yml
│       │   └── whisper/
│       │       └── docker-compose.yml
│       └── docs/
│           ├── infrastructure-overview.md
│           ├── storage-layout.md
│           ├── ollama.md
│           └── whisper.md
└── mnt/hdd/
    └── data/ (4 TB HDD Persistent Storage)
        ├── ollama/                     
        └── ai-models/
            └── whisper-cache/          