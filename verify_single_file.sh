#!/bin/bash
# need to verify all files exist then write to a file the urls for distribution
# first we need to download the  files, and ensure they match the original
FILENAME=`echo $2|rev|cut -d"/" -f1|rev`
ORIG=`md5sum $2|cut -d" " -f1`
echo grabbing file $FILENAME from $1
mkdir -p cur/$1
ncftpget -o connect_timeout=3 -r 0 $1 ./cur/$1 $FILENAME
if [ -e "./cur/$1/$FILENAME" ]; then
echo local file downloaded
CUR=`md5sum cur/$1/$FILENAME|cut -d" " -f1`
echo $ORIG $CUR strings
if [ "$ORIG" == "$CUR" ]; then
echo it is ok.
echo ftp://$1/$FILENAME >> final_good_list.txt
else
echo files didnt match on $1 [$FILENAME]
fi
else
echo didnt download $FILENAME from $1
fi
echo rm -f cur/$1/$FILENAME
