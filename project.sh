#!/bin/bash
# This line specifies that the program will be executed by Bash.

#:File check + user input

# Filename to check
DATA_FILE="Data.txt"

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

# Welcome message
echo "Welcome to the Travel Recommendation Program :) "

# Ask user for trip goal
read -p "Enter your travel goal (Education, Entertainment): " goal
goal_lower=$(echo "$goal" | tr '[:upper:]' '[:lower:]') # Convert user input to lowercase for easy comparison

# Ask user for the number of adults
read -p "Enter number of adults going on the trip: " adults

# Validate if the number is correct
if ! [[ "$adults" =~ ^[0-9]+$ ]]; then
  echo "Please enter a valid number."
  exit 1
fi

# Ask for budget level
echo "Choose budget level:"
echo "1) Low"
echo "2) Medium"
echo "3) High"
read -p "Enter option (1-3): " budget_choice

# Convert user input to budget label
case $budget_choice in
  1) budget="Low" ;;
  2) budget="Medium" ;;
  3) budget="High" ;;
  *) echo "Invalid budget choice." ; exit 1 ;;
esac

echo ""
echo "Fetching suggestions for you..."
echo "-------------------------------—-"

