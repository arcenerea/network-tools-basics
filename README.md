---

## Usage

Clone the repository and give execution permissions:

```bash
git clone https://github.com/arcenerea/network-tools-basics
cd network-tools-basics
chmod +x scripts/*.sh
```

---

## Scripts in detail

### network_info.sh
Displays full network information: active interfaces, IP addresses, subnet masks, default gateway and configured DNS servers.

```bash
./scripts/network_info.sh
```

---

### check_connection.sh
Tests connectivity to a target host or IP. Measures latency and packet loss. Useful for quick network troubleshooting.

```bash
./scripts/check_connection.sh 8.8.8.8
./scripts/check_connection.sh google.com
```

---

### port_scanner.sh
Scans TCP ports on a target host within a configurable range. Identifies open and closed ports.

```bash
./scripts/port_scanner.sh 192.168.1.1 1 1024
```

**Arguments:**
- `$1` — target host or IP
- `$2` — start port (default: 1)
- `$3` — end port (default: 1024)

---

### dns_lookup.sh
Performs DNS resolution, reverse lookup and nameserver queries for a given domain. Useful for DNS troubleshooting.

```bash
./scripts/dns_lookup.sh google.com
```

---

## Tech stack

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)

---

## Author

**Nerea Arce** — SysAdmin · DevOps · Cloud Infrastructure

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nerea-arce/)
[![GitHub](https://img.shields.io/badge/GitHub-arcenerea-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/arcenerea)
