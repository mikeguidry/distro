#!/bin/bash                                        
REMOTE=$1                                          
for i in `cat file_list.txt`                       
do                                                 
echo verifying file $i to remote host $REMOTE      
./verify_single_file.sh $REMOTE $i
done                                               
