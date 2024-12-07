#!/bin/bash

# Verifies if the number of arguments is correct
if [[ $# != 2 ]]; then
  echo "Usage: $0 target_directory_name destination_directory_name"
  exit 1
fi

# Verifies if the provided arguments are valid directory paths
if [[ ! -d $1 ]]; then
  echo "Error: $1 is not a valid directory."
  exit 1
fi

if [[ ! -d $2 ]]; then
  echo "Error: $2 is not a valid directory."
  exit 1
fi

# Sets absolute paths for the source and destination directories
targetDirectory=$(realpath "$1")
destinationDirectory=$(realpath "$2")

echo "The Target Directory is $targetDirectory"
echo "The Destination directory is $destinationDirectory"

# Gets the current timestamp in seconds
currentTS=$(date +%s)

# Defines the backup file name using the timestamp
backupFileName="backup-[$currentTS].tar.gz"

# Changes to the destination directory and gets its absolute path
cd "$destinationDirectory"
destDirAbsPath=$(pwd)

# Changes to the target directory
cd "$targetDirectory"

# Calculates the timestamp for 24 hours ago
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# Uses the 'find' command to get files modified in the last 24 hours
toBackup=($(find "$targetDirectory" -type f -newermt "@$yesterdayTS"))

# If there are files to back up, creates the .tar.gz backup file
if [[ ${#toBackup[@]} -gt 0 ]]; then
  tar -czvf "$backupFileName" "${toBackup[@]}"
  echo "Backup created successfully: $backupFileName"
else
  echo "No files to backup"
  exit 0
fi

# Moves the backup file to the destination directory
mv "$backupFileName" "$destDirAbsPath"
echo "Backup moved to $destDirAbsPath"
