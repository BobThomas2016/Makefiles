#       Author:  Bob Thomas
#		Creation Date:  2/25/2016
#		Due Date:  3/5/2016
#		Course:  CSC352
#		Professor:  Dr. Parson
#		Assignment:  #2
#		File name:  makefile 
#		Purpose: makefile for psdir in assignment 2

all:		build

# When ps.txt is newer than ../ps.out, or when ../ps.out does not exist, this rule runs 
../ps.out:	./ps.txt
	./analyzeps.sh ../ps.out

# Copy file ps.bak to ps.txt	
restore:	
	cp ps.bak ps.txt

# Runs script file scanps.sh	
scan:	
	./scanps.sh

# Build is dependent on ../ps.out	
build:	../ps.out

# Depends on Build
test:	build

# Removes the files created by this makefile
clean:
	/bin/rm -f ./ps.csv ../ps.out