#!/usr/bin/env bash


read -p "Enter The Incident NUM: " inc

#Stage_1

status=$(grep "$inc" /tmp/project/ticket_status | awk '{print $2}')
echo " Status is: $status"

#-------------------------------------------------------------------------

#stage_2 

eventid=$(grep "$inc" /tmp/project/event_tickets | awk '{print $2}')

if [ "$status" = "closed" ]; then


	echo " Event: "$eventid" || is Closed" >> events_status 
	echo "---------------------------------------------------------------" >> events_status
	echo " Event is closed!! "
elif [ "$status" = "opened" ]; then 

	echo " "$eventid" Still Opened"
fi

