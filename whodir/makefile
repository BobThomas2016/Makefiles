#       Author:  Bob Thomas
#		Creation Date:  2/25/2016
#		Due Date:  3/5/2016
#		Course:  CSC352
#		Professor:  Dr. Parson
#		Assignment:  #2
#		File name:  makefile 
#		Purpose: makefile for whodir in assignment 2

all:		build

# When who.txt is newer than ../who.out, or when ../who.out does not exist, this rule runs 
../who.out:	./who.txt
	./analyzewho.sh ../who.out

# Copy file who.bak to who.txt	
restore:	
	cp who.bak who.txt

# Runs script file scanwho.sh
scan:	
	./scanwho.sh

# Build is dependent on ../who.out
build:	../who.out

# Depends on Build
test:	build

# Removes the files created by this makefile
clean:
	/bin/rm -f ./who.csv ../who.out