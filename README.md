# Scripts Collection

This repository contains a collection of utility and security scripts designed to automate various tasks.

## Installation

To install all the necessary dependencies for these scripts, run the main setup script. This script will detect your Linux distribution and install the required packages.

```bash
sudo bash setup.sh
```

## Scripts

Here is a list of all the scripts in this collection, categorized by their functionality.

### Security

- **[Hash Cracker](./Sec/Hash_cracker.py)**: A powerful, multi-algorithm hash cracker that supports dictionary attacks, brute-force attacks, and hash verification.
- **[Port Scanner](./Sec/Port_scan.py)**: A fast, multi-threaded port scanner with service detection and JSON output.
- **[Packet Sniffer](./Sec/packet_sniffer.py)**: A network packet sniffer that can capture and analyze traffic, with support for various protocols and filtering.
- **[Reverse Shell Generator](./Sec/revshell.py)**: A versatile tool for generating reverse shell payloads for a wide range of platforms and web shells.
- **[Security Tools Installer](./Sec/sec.sh)**: A script to automate the installation of popular cybersecurity tools on Linux.
- **[Subdomain Enumerator](./Sec/subdomain.py)**: A subdomain enumeration tool with DNS and HTTP verification, zone transfer attempts, and JSON output.
- **[XSS Scanner](./Sec/xss.py)**: A scanner for detecting reflected and stored Cross-Site Scripting (XSS) vulnerabilities.

### Utilities

- **[Backup Manager](./utils/backup_manager.py)**: A script for creating and managing backups, with support for compression, incremental backups, and cleanup.
- **[Database Manager](./utils/db_manager.py)**: A tool for managing MySQL and PostgreSQL databases, including backup and restore functionality.
- **[Dependency Installer](./utils/dep.sh)**: A script to install all system and Python dependencies required by the scripts in this collection.
- **[File Organizer](./utils/file_organizer.py)**: A script for organizing files based on various criteria, such as type, date, or name.
- **[PDF Tools](./utils/pdf_tools.py)**: A suite of tools for manipulating PDF files, including merging, splitting, compressing, and converting.
- **[Web Scraper](./utils/scraper.py)**: An advanced web scraper for extracting data from websites, with support for custom selectors, crawling, and data export.
- **[System Monitor](./utils/sys_monitor.py)**: A real-time system monitor that tracks CPU, memory, disk, and network usage.
- **[YouTube Downloader](./utils/youtube_downloader.py)**: A tool for downloading videos and audio from YouTube, with support for various formats and playlists.