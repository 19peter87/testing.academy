#!/usr/bin/env bash

FILENAME=~/bin/movies.csv

while read -r LINE; do

ID=$(echo $LINE | egrep -o '^[0-9]+')
YEAR=$(echo $LINE | egrep -o "([0-9]{4})")
TITLE=$(echo $LINE | egrep -o ",.+ ")
GENRE=$(echo $LINE | egrep -o "(Action|Comedy|Drama|Horror|Thriller|Adventure|Sci-Fi|Children|Fantasy|Animation|Romance|Mystery|Crime|War|Western|Documentary|Musical|Film-Noir)")


echo -e "{
\"id\": $ID,
\"title\": \"$TITLE\",
\"year\": $YEAR,
 \"genres\": 
   $GENRE   
}"

done < $FILENAME







