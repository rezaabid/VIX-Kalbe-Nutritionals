#!/usr/bin/bash

path=/hdfs/data/data1
name_of_directory=data1

if [[ -d $path/$name_of_directory ]]; then
    echo "There is $name_of_directory Directory Exists!"
else
    echo "$name_of_directory Directory Not Exists!"
    sudo mkdir -p $path/$name_of_directory
fi