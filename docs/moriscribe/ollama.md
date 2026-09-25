# Ollama Service Setup

**Service:** Ollama (LLM Inference Engine)  
**Host Path:** `~/services/ollama/docker-compose.yml`  
**API Port:** `11434`  
**Default Model:** `qwen2.5:3b` (or `qwen2.5`)  

---

## Architecture & Storage
* **Container Image:** `ollama/ollama:latest`
* **GPU Acceleration:** NVIDIA GPU via `nvidia-container-toolkit`
* **Persistent Model Storage:** `/mnt/hdd/data/ollama` (Mounted to `/root/.ollama` inside container)

---

## Docker Compose Configuration

```yaml
services:
  ollama:
    image: ollama/ollama:latest
    container_name: ollama
    restart: unless-stopped
    ports:
      - "11434:11434"
    volumes:
      - /mnt/hdd/data/ollama:/root/.ollama
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]