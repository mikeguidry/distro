#!/bin/bash
REMOTE=$1
for i in `cat file_list.txt`
do
echo uploading file $i to remote host $REMOTE
ncftpput -o connect_timeout=3 -r 0 -R $REMOTE . $i
done
