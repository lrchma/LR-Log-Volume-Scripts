#/bin/bash

log=$1
echo "File: " $log

oldestlog=$(head -n 1 $log | grep -o '^[a-zA-Z]\{3\}\s\{1,2\}[0-9]\{1,2\}\s[0-9]\{2\}\:[0-9]\{2\}\:[0-9]\{2\}')
latestlog=$(tail -n 1 $log | grep -o '^[a-zA-Z]\{3\}\s\{1,2\}[0-9]\{1,2\}\s[0-9]\{2\}\:[0-9]\{2\}\:[0-9]\{2\}')

epocholdest=$(date -d "$oldestlog" +%s)
epochlatest=$(date -d "$latestlog" +%s)

totallogs=$(cat $log | wc -l)

echo "Total Logs: " $totallogs

duration=$(echo $((epochlatest-epocholdest)) | awk '{print ($1)}')

echo "Duration: " $duration

echo $totallogs $duration | awk '{print "MPS: " $1/$2}'
