#!/usr/bin/env bash

ex=""
while [ "$ex" != admin123 ]; do
	
read -p "Enter Password: " ex

if [ "$ex" != admin123 ]; then 
	echo "Valid Password, Try Again!"
elif [ "$ex" = admin123 ]; then 
	echo "Login Sucsses"
fi

done
