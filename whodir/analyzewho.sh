#!/bin/bash
# analyzewho.sh
# D. Parson, CSC 352 Unix, Spring 2016
# set -x
# The above line echoes this script's commands.
# This script runs for the makefile's build: target.
# It analyzes the contents of who.txt, creating
# who.csv with comma-separated user and remote IP
# address pairs, then extracts into the file
# passed to its command line the csv line for
# any user logged in through more than 1 remote
# address at a time.
# Use "sed" stream editor to create user,ipaddr csv lines.
sed -e 's/ .*(/,/' who.txt | sed -e 's/) *$//' |sort > who.csv
lastuser=''
lastipaddr=''
> $1        # over-write the output file specified on command line
for line in `cat who.csv`
do
    user=`echo $line | cut -d, -f1`
    ipaddr=`echo $line | cut -d, -f2`
    # echo DEBUG $user $ipaddr
    if [ "$user" == "$lastuser" ]
    then
        if [ "$ipaddr" != "$lastipaddr" ]
        then
            echo "$user,$lastipaddr,$ipaddr" >> $1
            lastipaddr=$ipaddr
        fi
    else
        lastuser="$user"
        lastipaddr="$ipaddr"
    fi
done
