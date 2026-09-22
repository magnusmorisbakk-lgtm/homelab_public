
# Server Storage Architecture & Layout

**Last Updated:** September 2026  
**System:** Ubuntu Server  
**Hostname:** `YOUR_HOSTNAME`  

---

## Hardware & Drive Overview

| Drive Identifier | Capacity | Type | Filesystem | Mount Point | Primary Purpose |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `/dev/nvme0n1` | ~500 GB | NVMe SSD | `ext4` (LVM) | `/` (Root) | OS, Databases, Application runtimes, Docker layers |
| `/dev/sda` | 4.0 TB | Mechanical HDD | `ext4` | `/mnt/hdd` | Bulk storage, Git repositories, Media, Backups |

---

## NVMe SSD Partition & Workload Allocation
### Key Paths on SSD
* `/`: Main root system directory.
* `/boot` & `/boot/efi`: EFI System Partition and Linux kernel images (`nvme0n1p1`, `nvme0n1p2`).
* `/var/lib/docker/`: Docker Engine, container image layers, and cache.
* `/var/opt/gitlab/`: Application runtime data and active databases (PostgreSQL, Redis).
* `/home/YOUR_USERNAME/`: User home directory, dotfiles, and active development source code.

---

## 4 TB HDD Directory Structure (`/mnt/hdd`)

The 4 TB HDD (`/dev/sda1`) is partitioned using GPT and formatted as `ext4`. It hosts large static data, backups, and offloaded application storage.

```text
/mnt/hdd/
├── backups/                
│   ├── gitlab/              # Offloaded GitLab automated backup .tar archives
│   └── system/              # Database dumps and configuration backups
├── data/                    # Primary bulk static data
│   ├── gitlab-repositories/ # Offloaded GitLab repository data & LFS objects
│   ├── downloads/           # Temporary download cache or large transfers
│   └── media/               # Media libraries (photos, videos, music)
├── docker-volumes/          
└── shares/                  # Local network shared folders (Samba / NFS)
    ├── private/             # Authenticated user file storage
    └── public/              # Shared network storage