#!/usr/bin/env bash

echo "Count From 1 TO 100"
num=1
sum=0

while [ $num -le 100 ]; do
	sum=$((sum + num))
	num=$((num + 1))
done 
echo "Sum= $sum"

#the sum of numbers from 1 to 100
	
