#!/usr/bin/env bash


#INPUT
read -p "Enter First Name: " fname
read -p "Enter Last Name: " lname
read -p "Enter Your Age: " age

#VAR
year=$(date +%Y)
birth_year=$(( year - age ))
cur_date=$( date +%Y-%m-%d )
#OUTPUT

echo "Hello $fname $lname, you were born at $birth_year" 
echo "Current Date: $cur_date" 


#EXPECTED OUTPUT
#----------------------------------------------
# Hello NAME NAME. You were born at BIRTH_YEAR"
# Current Date: year-month-day
#----------------------------------------------
