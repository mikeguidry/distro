#!/bin/bash
find files -type f  > file_list.txt
./feed_parallel.sh
