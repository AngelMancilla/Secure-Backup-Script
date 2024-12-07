# Secure Backup Script

This script automates the process of backing up files that have been modified within the last 24 hours from a target directory to a specified destination directory. It creates a compressed `.tar.gz` backup file and moves it to the destination directory.

## Features
- Validates the directories passed as arguments.
- Backs up files modified within the last 24 hours.
- Creates a compressed `.tar.gz` backup file.
- Moves the backup file to the destination directory.

## Requirements
- Linux-based OS (Ubuntu, CentOS, etc.).
- `tar` utility (usually pre-installed).
- `find` command (usually pre-installed).

## Usage

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/secure-backup-script.git
    cd secure-backup-script
    ```

2. Make the script executable:
    ```bash
    chmod +x backup.sh
    ``` 

3. Run the script with two directory paths as arguments: the target directory (source) and the destination directory (where the backup will be moved):
    ```bash
    ./backup.sh /path/to/target_directory /path/to/destination_directory
    ```

### Example
If you want to back up files from `/home/user/documents` to `/home/user/backups`, you would run:
```bash
./backup.sh /home/user/documents /home/user/backups
