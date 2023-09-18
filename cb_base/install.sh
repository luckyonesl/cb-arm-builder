#!/bin/bash

while read -r line
do
    yum install -y "$line"
done < $1
