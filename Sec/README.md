# Security Scripts

This directory contains a collection of scripts for performing various security-related tasks.

---

## Hash Cracker

This script is a multi-algorithm hash cracker that can perform dictionary attacks, brute-force attacks, and hash verification.

### Features

- **Multiple Algorithms**: Supports MD5, SHA1, SHA256, and SHA512.
- **Dictionary Attack**: Cracks hashes using a wordlist.
- **Brute-Force Attack**: Attempts to crack hashes by generating all possible combinations of characters.
- **Hash Verification**: Verifies if a given hash matches a password.

### Usage

To use the hash cracker, run the script with the desired options.

#### Dictionary Attack

```bash
python3 Hash_cracker.py -H <hash> -a <algorithm> -w <wordlist>

---

## Packet Sniffer

This script is a network packet sniffer that captures and analyzes network traffic. It can parse Ethernet, IPv4, ICMP, TCP, and UDP packets, and can filter by protocol and save captured packets to a JSON file.

### Features

- **Protocol Parsing**: Parses Ethernet, IPv4, ICMP, TCP, and UDP protocols.
- **Protocol Filtering**: Captures only the traffic of a specific protocol.
- **JSON Output**: Saves captured packets to a JSON file for later analysis.

### Usage

To use the packet sniffer, run the script with the desired options.

#### Sniff all traffic

```bash
sudo python3 packet_sniffer.py

---

## Reverse Shell Generator

This script generates reverse shell payloads for various platforms and web shells. It supports Base64 and URL encoding, and can generate listener commands.

### Features

- **Multiple Platforms**: Generates payloads for Bash, Netcat, Python, Perl, PHP, Ruby, Java, PowerShell, Socat, AWK, Lua, Node.js, Telnet, and Golang.
- **Web Shells**: Generates web shell payloads for PHP, JSP, and ASP.
- **Encoding**: Supports Base64 and URL encoding.
- **Listener Commands**: Generates listener commands for `nc`, `ncat`, and `socat`.

### Usage

To use the reverse shell generator, run the script with the desired options.

#### Generate a Bash reverse shell

```bash
python3 revshell.py -p bash -i <your_ip> -P <your_port>

---

## Security Tools Installer

This script automates the installation of popular cybersecurity tools on Linux. It detects the distribution and installs base dependencies, reconnaissance tools, vulnerability scanners, and web tools.

### Features

- **Distribution Detection**: Automatically detects the Linux distribution (Debian-based, Fedora-based, or Arch-based).
- **Tool Installation**: Installs a suite of security tools, including:
  - **Reconnaissance**: Nmap, Masscan, Amass, Subfinder, DNSenum
  - **Vulnerability Scanners**: Nikto, Nuclei, Wapiti
  - **Web Tools**: Gobuster, Ffuf

### Usage

To use the security tools installer, run the script with root privileges.

```bash
sudo bash sec.sh

---

## Subdomain Enumerator

This script performs subdomain enumeration with DNS and HTTP verification. It uses a common subdomain wordlist or a custom one, supports multi-threading, can attempt DNS zone transfers, and retrieves various DNS records. Results can be saved to a JSON file.

### Features

- **Wordlist-based Enumeration**: Uses a wordlist to discover subdomains.
- **DNS and HTTP Verification**: Verifies the existence of subdomains using DNS and HTTP requests.
- **Zone Transfer**: Attempts to perform a DNS zone transfer.
- **DNS Record Retrieval**: Retrieves various DNS records (A, AAAA, CNAME, MX, NS, TXT).
- **JSON Output**: Saves the results to a JSON file.

### Usage

To use the subdomain enumerator, run the script with the target domain and desired options.

#### Enumerate subdomains for a domain

```bash
python3 subdomain.py <domain>

---

## XSS Scanner

This script scans for reflected and stored Cross-Site Scripting (XSS) vulnerabilities. It scans URLs and forms using common XSS payloads and bypass payloads, checking for their presence in the HTTP response.

### Features

- **Reflected and Stored XSS**: Scans for both reflected and stored XSS vulnerabilities.
- **URL and Form Scanning**: Scans both URLs and forms for vulnerabilities.
- **Payloads**: Uses a list of common XSS payloads and bypass payloads.

### Usage

To use the XSS scanner, run the script with the target URL and desired options.

#### Scan a URL for XSS vulnerabilities

```bash
python3 xss.py -u <url>
```

#### Scan a URL and its forms for XSS vulnerabilities

```bash
python3 xss.py -u <url> --forms
```

#### Enumerate subdomains with a custom wordlist and save to a file

```bash
python3 subdomain.py <domain> -w <wordlist> -o subdomains.json
```

#### Generate a PHP web shell with Base64 encoding

```bash
python3 revshell.py -p php -i <your_ip> -P <your_port> -e base64
```

#### Sniff TCP traffic and save to a file

```bash
sudo python3 packet_sniffer.py -p tcp -o captured_packets.json
```

#### Brute-Force Attack

```bash
python3 Hash_cracker.py -H <hash> -a <algorithm> -b -c <charset> -l <max_length>
```

#### Hash Verification

```bash
python3 Hash_cracker.py -H <hash> -a <algorithm> -p <password>
```

---

## Port Scanner

This script is a multi-threaded port scanner that can detect services running on open ports and save the results to a JSON file.

### Features

- **Multi-threaded**: Scans multiple ports concurrently for faster results.
- **Service Detection**: Identifies the services running on open ports.
- **Custom Port Selection**: Scan specific ports, a range of ports, or the most common ports.
- **JSON Output**: Saves the scan results to a JSON file for easy parsing.

### Usage

To use the port scanner, run the script with the target host and desired options.

#### Scan Specific Ports

```bash
python3 Port_scan.py <host> -p 22,80,443
```

#### Scan a Range of Ports

```bash
python3 Port_scan.py <host> -p 1-1024
```

#### Scan Common Ports and Save to File

```bash
python3 Port_scan.py <host> --common-ports -o scan_results.json
```