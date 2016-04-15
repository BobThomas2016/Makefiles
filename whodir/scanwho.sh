#!/bin/bash
# scanwho.sh
# D. Parson, CSC 352 Unix, Spring 2016
# set -x
# The above line echoes this script's commands.
# This script runs for the makefile's scan: target.
# It updates the so-called source file who.txt only
# when "make scan" is invoked, by running who as follows:
who > who.txt
# who | sed -e 's/ .*(/,/' | sed -e 's/) *$//' |sort > who.csv
