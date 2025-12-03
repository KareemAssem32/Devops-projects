#!/usr/bin/env bash


#INPUT

read -p "Enter Your Grade: " grade

if [[ "${grade}" =~ ^[0-9]+$ ]]; then
echo "---------------------"
else 
	echo "Error: Enter Grade (Number Only)!!"
exit 1
fi 

#OUTPUT

 if [[ "${grade}" -ge 90 ]]; then
	 echo "Your Grade = A"
 elif [[ "${grade}" -ge 80 ]] && [[ "${grade}" -le 89 ]]; then
	 echo "Your Grade = B"
 elif [[ "${grade}" -ge 70 ]] && [[ "${grade}" -le 79 ]]; then
	echo "Your Grade = C"	 
 elif [[ "${grade}" -ge 60 ]] && [[ "${grade}" -le 69 ]]; then
	 echo "Your Grade = C"
elif [[ "${grade}" -lt 60 ]]; then 
	echo " Your Grade = F!" 
 fi
  
echo "---------------------"
  
