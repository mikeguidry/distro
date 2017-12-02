#!/bin/bash
cat ftp_uniq.txt|parallel -j 500 ./verify_all_files.sh
