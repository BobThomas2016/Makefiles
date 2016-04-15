#!/bin/bash
# analyzeps.sh
# D. Parson, CSC 352 Unix, Spring 2016
# set -x
# The above line echoes this script's commands.
# This script runs for the makefile's build: target.
# It analyzes the contents of ps.txt, creating
# ps.csv with comma-separated user and Unix
# command pairs, then extracts into the file
# passed to its command line the csv line for
# any user running more than 1 command at a time.
# Use "sed" stream editor to create user,command csv lines.
sed -e 's/ .*:[0-9][0-9] /,/' ps.txt | sed -e 's/ *$//' | sed -e 's/[ 	][ 	]*/_/g' | sort > ps.csv
lastuser=''
lastcommand=''
> $1        # over-write the output file specified on command line
for line in `cat ps.csv`
do
    user=`echo $line | cut -d, -f1`
    command=`echo $line | cut -d, -f2`
    # echo DEBUG $user $command
    if [ "$user" == "$lastuser" ]
    then
        if [ "$command" != "$lastcommand" ]
        then
            echo "$user,$lastcommand,$command" >> $1
            lastcommand=$command
        fi
    else
        lastuser="$user"
        lastcommand="$command"
    fi
done
