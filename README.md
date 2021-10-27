# encrypted-backup
how to create an encrypted compressed archive from custom source path to custom path destination. Supports files and folders exclusions from txt file. 

## Installation
`sudo chmod +x /path/to/encrypted-baskup.sh`

## Usage
`/path/to/encrypted-baskup.sh /path/from/files/ /path/to/destination/ /path/to/excluded.txt`

## How to decrypt
`gpg -o manual-backup-ddaaYYYY-HHMM.tar.xz -d manual-backup-ddaaYYYY-HHMM.tar.xz.gpg`
