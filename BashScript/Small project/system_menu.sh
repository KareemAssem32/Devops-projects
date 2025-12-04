#!/usr/bin/env bash

#OUTPUT
echo "1)Show Date And Time"
echo "2)Display Current User"
echo "3)Show Current Directory"
echo "4)List Files in Current Directory"
echo "5)Display Disk Usage"
echo "6)Exit"

#INPUT

read -p "Choose The Service: " num

if [[ "${num}" =~ ^[0-9]+$ ]]; then
	echo "------------------- "
else 
	echo "Enter Service Number!"
exit 1
	fi


#SERVICE

case $num in 
	1) 
	echo " The Date And Time Is: $(date) "
		;;
	2)
		echo " The Current User is: $(whoami)"
		;;
	3)
		echo " The Current Directory Is: $(pwd) "
		;;
	4)
		echo "List OF Files And Directory: "
		echo "-----------------------------"
		echo " $(ls -a) "
		;;
	5)
		echo "Disk Usage"
		echo "----------"
		echo " $(df -h) "
		;;
	6) 
		exit 0

		;;
	*)
		echo "No Sevices Have This Number!"
		;;
esac
