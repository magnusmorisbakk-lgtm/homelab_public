# Homelab Server Architecture & Services

## Navigation

* [Tailscale & Networking](docs/tailscale-setup.md): Remote access, exit node setup, and UFW subnet routing configuration.
* [Storage Layout](docs/storage-layout.md): Partition breakdown across NVMe SSD (`/`) and 4TB HDD (`/mnt/hdd`).
* [Infrastructure Overview](docs/infrastructure-overview.md): Global server specs, full port matrix, and system health commands.
* [Ollama LLM Setup](docs/ollama.md): GPU-accelerated Ollama deployment guide and model management commands.
* [Faster-Whisper STT Setup](docs/whisper.md): OpenAI-compatible speech-to-text API service documentation.

---

## Services

### Monitoring

| Service | Purpose |
| :--- | :--- |
| **[Uptime Kuma](https://github.com/louislam/uptime-kuma)** | Self-hosted monitoring tool for tracking service availability, HTTP endpoints, and infrastructure health. |
| **Grafana** | Visualization and dashboard for present time metrics from Prometheus.|
| **Prometheus** | Pulls, indexes and stores real time metrics. |
| **Node Exporter** | Light agent colecting kernel and hardware performance metrics. Exposes them for Prometheus. |


### MoriScribe
Privacy-focused, self-hosted AI transcription project. Designed to convert spoken audio into formatted text locally on your own infrastructure without relying on external cloud APIs.

**Repository:** [MoriScribe GitHub Repository](https://github.com/magnusmorisbakk-lgtm/MoriScribe)

| Service | Purpose |
| :--- | :--- |
| **Whisper** | Acts as the local speech recognition engine. Processes raw audio files and extracts text transcripts. |
| **Ollama** | Serves as the local LLM runtime. Used to summarize and format the raw transcript from Whisper. |

### Game Servers
| Service | Purpose |
| :--- | :--- |
| **Valheim Server** | Dedicated Valheim server with automated backups. |

---

## System Hardware

| Component | Specification |
| :--- | :--- |
| **Host Name** | `YOUR_HOSTNAME` |
| **OS / Kernel** | Ubuntu Server |
| **GPU Acceleration** | NVIDIA GPU (CUDA Supported) |
| **CPU** | Ryzen 5 3600 (6 Cores / 12 Threads) |
| **RAM** | 16 GB DDR4 |
| **Tailscale Address** | `YOUR_TAILSCALE_IP` |
| **Local LAN IP** | `YOUR_LOCAL_IP` |

---

## Repository Structure

```text
.
├── README.md
├── docs/
│   ├── infrastructure-overview.md
│   ├── storage-layout.md
│   ├── tailscale-setup.md
│   ├── ollama.md
│   └── whisper.md
└── services/
    ├── moriscribe
    │     ├── ollama/
    │     └── whisper/           
    ├── monitoring/
    │       ├── grafana/
    │       ├── prometheus/
    │       ├── node-exporter/
    │       └── uptime-kuma/
    └── game-servers/
             └── valheim/