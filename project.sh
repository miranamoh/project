#!/bin/bash
# This line specifies that the program will be executed by Bash.
#:File check + user input
# Filename to check
DATA_FILE="Data.txt"

# Check if file exists and is readable
# Check if the file exists
if [ -e "$DATA_FILE" ]; then
  # Check if the file is readable
  if [ -r "$DATA_FILE" ]; then
    echo "The file is readable."
  else
    echo "The file is not readable."
    exit 1
  fi
else
  echo "The file does not exist."
  exit 1
fi
