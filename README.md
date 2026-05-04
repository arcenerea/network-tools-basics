# 🌐 Network Tools — Bash Toolkit

A collection of Bash scripts for network diagnostics, connectivity checks, port scanning and DNS resolution. Built for Linux systems administrators and DevOps engineers.

Built and documented by [Nerea Arce](https://www.linkedin.com/in/nerea-arce/) · SysAdmin & DevOps Engineer

---

## Scripts

| Script | Description |
|--------|-------------|
| `network_info.sh` | Network interfaces, IP addresses, gateway and DNS info |
| `check_connection.sh` | Connectivity check, ping and latency measurement |
| `port_scanner.sh` | TCP port scanning with configurable range |
| `dns_lookup.sh` | DNS resolution, reverse lookup and diagnostics |

---

## Usage

Clone the repository and give execution permissions:

    git clone https://github.com/arcenerea/network-tools-basics
    cd network-tools-basics
    chmod +x scripts/*.sh

---

## Scripts in detail

### network_info.sh
Displays full network information: active interfaces, IP addresses, subnet masks, default gateway and configured DNS servers.

    ./scripts/network_info.sh

---

### check_connection.sh
Tests connectivity to a target host or IP. Measures latency and packet loss.

    ./scripts/check_connection.sh 8.8.8.8
    ./scripts/check_connection.sh google.com

---

### port_scanner.sh
Scans TCP ports on a target host within a configurable range. Identifies open and closed ports.

    ./scripts/port_scanner.sh 192.168.1.1 1 1024

Arguments: target host, start port, end port.

---

### dns_lookup.sh
Performs DNS resolution, reverse lookup and nameserver queries for a given domain.

    ./scripts/dns_lookup.sh google.com

---

## Tech stack

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)

---

## Author

**Nerea Arce** — SysAdmin · DevOps · Cloud Infrastructure

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nerea-arce/)
[![GitHub](https://img.shields.io/badge/GitHub-arcenerea-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/arcenerea)
