#!/usr/bin/env bash

num=2

until [ "$num" -gt 20 ]; do
	echo "$num"
	num=$((num + 2))
done

#print even numbers from 2 to 2
