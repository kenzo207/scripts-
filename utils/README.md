# Utility Scripts

This directory contains a collection of scripts for performing various utility tasks.

---

## Backup Manager

This script is for backing up and synchronizing files and folders. It supports compression, incremental backups, exclusion patterns, and cleanup of old backups.

### Features

- **Compression**: Supports ZIP and TAR.GZ compression.
- **Incremental Backups**: Only backs up files that have changed.
- **Exclusion Patterns**: Exclude files and folders from the backup.
- **Cleanup**: Deletes old backups.

### Usage

To use the backup manager, run the script with the desired options.

#### Create a full backup

```bash
python3 backup_manager.py -s <source_dir> -d <dest_dir> -c zip

---

## Database Manager

This script is for managing MySQL and PostgreSQL databases, including backup and restore functionalities. It supports compression for backups and handles database credentials securely.

### Features

- **MySQL and PostgreSQL Support**: Manages both MySQL and PostgreSQL databases.
- **Backup and Restore**: Performs database backups and restores.
- **Compression**: Compresses backups to save space.

### Usage

To use the database manager, run the script with the desired options.

#### Backup a MySQL database

```bash
python3 db_manager.py mysql backup -d <database> -u <user> -p <password> -o <output_file>

---

## Dependency Installer

This script installs system and Python dependencies required by the script collection. It detects the Linux distribution and installs tools like `poppler-utils`, `ffmpeg`, `libpcap-dev`, `mysql-client`, and `postgresql-client`, along with Python packages from `requirements.txt`.

### Features

- **Distribution Detection**: Automatically detects the Linux distribution.
- **System and Python Dependencies**: Installs all necessary system and Python dependencies.

### Usage

To use the dependency installer, run the script with root privileges.

```bash
sudo bash dep.sh

---

## File Organizer

This script organizes files based on type, date, extension, or the first letter of their name. It supports recursive organization, dry-run mode, and duplicate file detection using MD5 hashes.

### Features

- **Multiple Organization Methods**: Organize files by type, date, extension, or first letter.
- **Recursive Organization**: Organize files in subdirectories.
- **Dry-Run Mode**: Preview the changes before they are made.
- **Duplicate File Detection**: Detects and handles duplicate files.

### Usage

To use the file organizer, run the script with the desired options.

#### Organize files by type

```bash
python3 file_organizer.py <directory> -by type

---

## PDF Tools

This script is a suite of tools for manipulating PDF files. It can merge, split, compress, and convert PDF files.

### Features

- **Merge**: Merge multiple PDF files into one.
- **Split**: Split a PDF file into multiple files.
- **Compress**: Compress a PDF file to reduce its size.
- **Convert**: Convert images to a PDF file.

### Usage

To use the PDF tools, run the script with the desired command and options.

#### Merge PDF files

```bash
python3 pdf_tools.py merge -i <file1.pdf> <file2.pdf> -o <merged.pdf>

---

## Web Scraper

This script is an advanced web scraper for extracting data from websites. It supports custom selectors, crawling, and data export.

### Features

- **Custom Selectors**: Use CSS selectors to extract specific data.
- **Crawling**: Crawl a website to a specified depth.
- **Data Export**: Export scraped data to JSON or CSV.

### Usage

To use the web scraper, run the script with the target URL and desired options.

#### Scrape a single page

```bash
python3 scraper.py <url>

---

## System Monitor

This script is a real-time system monitor that tracks CPU, memory, disk, and network usage.

### Features

- **Real-time Monitoring**: Tracks system resources in real time.
- **Resource Usage**: Monitors CPU, memory, disk, and network usage.
- **Alerts**: Sends alerts when resource usage exceeds a certain threshold.

### Usage

To use the system monitor, run the script with the desired options.

#### Monitor the system in real time

```bash
python3 sys_monitor.py

---

## YouTube Downloader

This script is a tool for downloading videos and audio from YouTube. It supports various formats and playlists.

### Features

- **Video and Audio Downloads**: Download both videos and audio from YouTube.
- **Format Selection**: Choose from a variety of video and audio formats.
- **Playlist Support**: Download entire playlists.

### Usage

To use the YouTube downloader, run the script with the video URL and desired options.

#### Download a video in the best quality

```bash
python3 youtube_downloader.py <url>
```

#### Download the audio of a video in MP3 format

```bash
python3 youtube_downloader.py <url> -a
```

#### Monitor the system and log the data to a file

```bash
python3 sys_monitor.py -l system_log.json
```

#### Crawl a website and save the data to a JSON file

```bash
python3 scraper.py <url> -d 2 -o scraped_data.json
```

#### Split a PDF file

```bash
python3 pdf_tools.py split -i <input.pdf> -o <output_directory>
```

#### Organize files by date with recursive organization

```bash
python3 file_organizer.py <directory> -by date -r
```

#### Restore a PostgreSQL database

```bash
python3 db_manager.py postgres restore -d <database> -u <user> -p <password> -i <input_file>
```

#### Create an incremental backup

```bash
python3 backup_manager.py -s <source_dir> -d <dest_dir> -i
```