#!/bin/bash

shopt -s globstar
cd /root/dp

for file in *.isyntax 
do 
	echo $file
	python3 /root/PythonTools/isyntax_to_tiff.py "$file" 1 0 0 
	python3 /root/PythonTools/dump_macro_label.py "$file"
 	#chmod --reference=$file "${file%%.*}*" 
  	chmod --reference=$file $(basename "$file").*
   	chown --reference=$file $(basename "$file").*
done
