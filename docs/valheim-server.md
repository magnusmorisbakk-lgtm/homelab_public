# Valheim Dedicated Server Setup

**Service:** Valheim Dedicated Server  
**Host Path:** `~/services/valheim/docker-compose.yml`  
**Base Repository:** [indifferentbroccoli/valheim-server-docker](https://github.com/indifferentbroccoli/valheim-server-docker)  
**Ports:** `2456:2456/udp`, `2457:2457/udp`  

---

## Architecture & Storage

* **Container Image:** `indifferentbroccoli/valheim-server-docker:latest`
* **Persistent World & Save Storage:** `/mnt/hdd/data/valheim/saves` (Mounted to `/home/steam/.config/unity3d/IronGate/Valheim`)
* **Server Data Storage:** `/mnt/hdd/data/valheim/server` (Mounted to `/home/steam/valheim`)

---

## Environment Variables Configuration

Sensitive configurations (passwords, world names) are managed via environment variables to keep repository templates clean.

| Key | Example Value | Description |
| :--- | :--- | :--- |
| `NAME` | `YOUR_SERVER_NAME` | The visible name of the server in the Valheim server browser. |
| `WORLD` | `YOUR_WORLD_NAME` | Name of the world save directory. |
| `PASSWORD` | `YOUR_SECRET_PASSWORD` | Password required to join (minimum 5 characters). |
| `PUBLIC` | `1` | `1` to list publicly in the server browser, `0` for private/direct IP join. |
| `UPDATE_ON_STARTUP` | `1` | Checks and installs Valheim game updates automatically on container start. |

---

## Docker Compose Configuration

```yaml
services:
  valheim:
    image: indifferentbroccoli/valheim-server-docker
    container_name: valheim-server
    restart: unless-stopped
    stop_grace_period: 30s
    ports:
      - "2456:2456/udp"
      - "2457:2457/udp"
    environment:
      PUID: 1000
      PGID: 1000
    env_file:
        - .env
    volumes:
      - /mnt/hdd/data/valheim/saves:/home/steam/.config/unity3d/IronGate/Valheim
      - /mnt/hdd/data/valheim/server:/home/steam/valheim