# Faster-Whisper Service Setup (`moris`)

**Service:** Faster-Whisper Server (Speech-to-Text API)  
**Host Path:** `~/services/whisper/docker-compose.yml`  
**API Port:** `9000` (Mapped to container port `8000`)  
**API Compatibility:** OpenAI `/v1/audio/transcriptions`  

---

## Architecture & Storage
* **Container Image:** `fedirz/faster-whisper-server:latest-cuda`
* **GPU Acceleration:** NVIDIA GeForce RTX 2060 via `nvidia-container-toolkit`
* **Model Cache Storage:** `/mnt/hdd/data/ai-models/whisper-cache` (Mounted to `/root/.cache/huggingface`)
* **Default Engine Settings:** `WHISPER_MODEL=base`, `WHISPER_INFERENCE_DEVICE=cuda`

---

## Docker Compose Configuration

```yaml
services:
  whisper:
    image: fedirz/faster-whisper-server:latest-cuda
    container_name: whisper-server
    restart: unless-stopped
    ports:
      - "9000:8000"
    environment:
      - WHISPER_MODEL=base
      - WHISPER_INFERENCE_DEVICE=cuda
    volumes:
      - /mnt/hdd/data/ai-models/whisper-cache:/root/.cache/huggingface
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]