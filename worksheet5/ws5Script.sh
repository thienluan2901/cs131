#!/bin/bash
# Set the Internal Field Separator to newline to read each line correctly
IFS=$'\n'

for line in $(cat "$1"); do
    # Extract the 8th field using awk
    country=$(echo "$line" | awk -F',' '{print $8}')

    # Check if the 8th field is "United States"
    if [ "$country" == "United States" ]; then
        category=$(echo "$line" | awk -F',' '{print $5}')
        echo "$line" >> UnitedStates/"$category".txt
    fi
done

