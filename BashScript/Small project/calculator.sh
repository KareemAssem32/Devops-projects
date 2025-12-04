#!/usr/bin/env bash

#OUTPUT
echo "-------------"
echo "1)ADD(+)"
echo "2)SUBTRACT(-)"
echo "3)MULTIPLY(x)"
echo "4)DIVIDE(/)"
echo "5)EXIT"
echo "-------------"

#INPUT
read -p "Choose Arithmetic Operation: " cal
echo "------------------------------"
#--------------------------------------

case $cal in
	1) 
read -p "Enter First Number: " num1
read -p "Enter Second Number: " num2
	sum=$(( num1 + num2 ))
	echo "------------------------"
	echo " "$num1"+"$num2"="$sum" "
	echo "------------------------"
	;;
	2) 
read -p "Enter First Number: " num1
read -p "Enter Second Number: " num2
	sum=$(( num1 - num2 ))
	echo "------------------------"
	echo " "$num1"-"$num2"="$sum" "
	echo "------------------------"
	;;
	3) 
read -p "Enter First Number: " num1
read -p "Enter Second Number: " num2
	sum=$(( num1 * num2 ))
	echo "------------------------"
	echo " "$num1"x"$num2"="$sum" "
	echo "------------------------"
	;;
	4) 
read -p "Enter First Number: " num1
read -p "Enter Second Number: " num2
	sum=$(( num1 / num2 ))
	echo "------------------------"
	echo " "$num1"/"$num2"="$sum" "
	echo "------------------------"
	;;
	5)
		echo "BYE BYE :)"
		exit 0
		;;
	*)
	echo "Invalid Choose!!"
	;;
esac	
