# encrypted-backup
create an encrypted tar archive from source to destination with files and folders exclusions 

## Installation
`sudo chmod +x /path/to/encrypted-baskup.sh`

## Usage
`sudo /path/to/encrypted-baskup.sh /path/from/files/ /path/to/destination/ /path/to/excluded.txt`

## How to decrypt
`gpg -o manual-backup-ddaaYYYY-HHMM.tar.xz -d manual-backup-ddaaYYYY-HHMM.tar.xz.gpg`
