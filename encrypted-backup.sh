#!/bin/bash
#
# NAME
# encrypted-baskup.sh - how to create an encrypted compressed archive from custom source path to custom path destination.
# Supports files and folders exclusions from txt file. 
#
# SYNOPSIS
# sudo ./encrypted-baskup.sh /path/from/files/ /path/to/destination/ /path/to/excluded.txt
#
# AUTHOR: 
# backup-website-database.sh is written by Alfio Salanitri www.alfiosalanitri.it and are licensed under the MIT License.

# user input args
backup_source=$1
backup_dest=$2
backup_excluded=$3
# global args
backup_temp=/tmp/manual-backup/
# convert source path to string. Es.: /path/to/Source Dir to path-to-Source-Dir
filename_prefix=$(echo $backup_source | sed -e 's/\//-/g;s/ /-/g;s/^-\(.*\)-$/\1/')

# check arguments
if [ ! -d "$1" ]; then
  printf "Backup source directory doesn't exists.\n"
  exit 1
fi
if [ ! -d "$2" ]; then
  printf "Backup destination directory doesn't exists.\n"
  exit 1
fi
if [ ! -f "$3" ]; then
  printf "Backup txt file with excluded files and directory doesn't exists. If no files or folders to exclude, pass an empty txt file.\n"
  exit 1
fi

# create temp directory
sudo mkdir $backup_temp

# sync backup source path to tmp dir
printf "Rsync started, please wait...\n"
sudo rsync -zarhL --relative --stats --delete --exclude-from="$backup_excluded" "$backup_source" "$backup_temp"

# compress tmp dir to dest dir
printf "Rsync completed. Compressing temp dir, please wait...\n"
backup_filename="${backup_dest}${filename_prefix}-$(date +%d%m%Y-%H%M).tar.xz"
sudo tar cJfP $backup_filename $backup_temp

# remove temp dir
printf "Compressed archive created. Cleaning...\n"
sudo rm -r $backup_temp

# encrypt archive
gpg -c $backup_filename

# remove tar
sudo rm $backup_filename

# end
printf "Backup successfully saved.\n"
exit 1
~      
