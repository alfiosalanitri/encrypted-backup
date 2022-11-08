# encrypted-backup
bash script to create compressed archive from source path to destination.
Supports files and folders exclusions from txt file and optional encryption with password.

## Installation
`chmod +x /path/to/encrypted-baskup`

## Usage
- `/path/to/encrypted-baskup /path/from/files/ /path/to/destination/`
- `/path/to/encrypted-baskup /path/from/files/ /path/to/destination/ /path/to/excluded.txt`

## How to decrypt
`gpg -o manual-backup-ddmmYYYY-HHMM.tar.xz -d manual-backup-ddmmYYYY-HHMM.tar.xz.gpg`
