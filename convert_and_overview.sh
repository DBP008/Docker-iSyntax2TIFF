#!/bin/bash

shopt -s globstar
cd /root/dp

exec &> >(tee -a log.out)

for file in *.isyntax *.i2syntax
do 
	echo $file
	python3 /root/PythonTools/isyntax_to_tiff.py "$file" 1 0 0 
	python3 /root/PythonTools/dump_macro_label.py "$file"
  	chown --reference="$file" "${file%%.*}"*.*
  	chmod --reference="$file" "${file%%.*}"*.*
done
