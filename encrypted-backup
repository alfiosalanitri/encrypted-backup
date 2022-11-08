#!/bin/bash
#
# NAME
# encrypted-baskup.sh - create compressed archive from source path to destination.
# Supports files and folders exclusions from txt file and encryption with password.
#
# SYNOPSIS
# - sudo ./encrypted-baskup.sh /path/from/files/ /path/to/destination/
# - sudo ./encrypted-baskup.sh /path/from/files/ /path/to/destination/ /path/to/excluded.txt
#
# AUTHOR: 
# backup-website-database.sh is written by Alfio Salanitri www.alfiosalanitri.it and are licensed under the MIT License.

#############################################################
# Icons	and color
# https://www.techpaste.com/2012/11/print-colored-text-background-shell-script-linux/
# https://apps.timwhitlock.info/emoji/tables/unicode
#############################################################
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
nocolor='\033[0m'
icon_ok='\xE2\x9C\x94'
icon_ko='\xe2\x9c\x97'
icon_wait='\xE2\x8C\x9B'
icon_rocket='\xF0\x9F\x9A\x80'

# user input args
backup_source=$1
backup_dest=$2
# convert source path to string. Es.: /path/to/Source Dir to path-to-Source-Dir
filename_prefix=$(echo $backup_source | sed -e 's/\//-/g;s/ /-/g;s/^-\(.*\)-$/\1/')

# check required arguments
if [ ! -d "$1" ]; then
  printf "[${red}${icon_ko}${nocolor}] Sorry, but ${green}Backup source directory${nocolor} doesn't exists.\n"
  exit 1
fi
if [ ! -d "$2" ]; then
  printf "[${red}${icon_ko}${nocolor}] Sorry, but ${green}Backup destination directory${nocolor} doesn't exists.\n" 
  exit 1
fi

sudo printf "\n[${yellow}${icon_wait}${nocolor}] Compressing source path, please wait...\n"
backup_filename="${backup_dest}${filename_prefix}-$(date +%d%m%Y-%H%M).tar.xz"

# check files or folder to exclude
if [ -z "$3" ]; then
  sudo tar cJfP $backup_filename $backup_source
else
  # check if excluded file exists
  if [ ! -f "$3" ]; then
    printf "[${red}${icon_ko}${nocolor}] Sorry, but ${green}Backup txt file${nocolor} with excluded files and directory doesn't exists.\n"
    exit 1
  fi
  sudo tar cJfP $backup_filename -X $3 $backup_source
fi
printf "[${green}${icon_ok}${nocolor}] Source path compressed.\n\n"
printf "[${yellow}${icon_wait}${nocolor}] Do you want to encrypt the archive?\n"
echo ""
PS3="Type 1 or 2: "
actions=("Yes" "No")
select action in "${actions[@]}"; do
  case $action in
  "Yes")
    # encrypt archive
    gpg -c $backup_filename

    # remove tar
    sudo rm $backup_filename
    printf "[${green}${icon_rocket}${nocolor}] Archive encrypted with success.\n"
    break
    ;;
  "No")
    printf "[${green}${icon_rocket}${nocolor}] Archive saved without encryption.\n"
    break
    ;;
  *) printf "[${red}${icon_ko}${nocolor}] $REPLY isn't a valid option. Try again\n" ;;
  esac
done
exit 1
