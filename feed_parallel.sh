#!/bin/bash
#throws ips at the parallel script to upload files
cat ftp_uniq.txt|parallel -j 1000 ./upload_files.sh
