#       Author:  Bob Thomas
#		Creation Date:  2/25/2016
#		Due Date:  3/5/2016
#		Course:  CSC352
#		Professor:  Dr. Parson
#		Assignment:  #2
#		File name:  makefile 
#		Purpose: makefile for make1 in assignment 2

all:		build

TARGET=make1
REFFILES=$(wildcard *.ref)

include ./makelib

# Runs whenever its .out file is newer than the correspondingly named .ref file. It runs diff between the .out file 
# and the .ref file, creates a file with the same name as the .ref file but with an added extension of .dif , reports 
# an error when there is a difference, otherwise using the Unix touch command to update the timestamp on the .ref file
%.ref :	%.out
	diff $< $@ > $@.dif
	touch $@
	
	
# CD's into each sub-directory and recursively runs make build.
build:
	cd ./psdir && $(MAKE) build
	cd ./whodir && $(MAKE) build

# CD's into each sub-directory and recursively runs make test.  Then runs make subtest.
test:
	cd ./psdir && $(MAKE) test
	cd ./whodir && $(MAKE) test
	make subtest

# Makes the REFFILES up to date.	
subtest: $(REFFILES)

# CD's into each sub-directory and recursively runs make scan.
scan:
	cd ./psdir && $(MAKE) scan
	cd ./whodir && $(MAKE) scan

# CD's into each sub-directory and recursively runs make restore.	
restore:
	cd ./psdir && $(MAKE) restore
	cd ./whodir && $(MAKE) restore

# CD's into each sub-directory and recursively runs make clean.  Then cleans the files created by this makefile.
clean:
	cd ./psdir && $(MAKE) clean
	cd ./whodir && $(MAKE) clean
	/bin/rm -f *.dif