# encrypted-backup
Bash script to create an encrypted tar archive of a given directory.
Supports files and folders exclusions listed in the excluded.txt file

## Installation
`chmod +x /path/to/encrypted-backup`

## Usage
- `/path/to/encrypted-backup /path/from/files/ /path/to/destination/`
or
- `/path/to/encrypted-backup /path/from/files/ /path/to/destination/ /path/to/excluded.txt`

## How to decrypt
`gpg -o backup-file.tar -d backup-file.tar.gpg`
