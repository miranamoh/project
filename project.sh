#!/bin/bash 
# This line specifies that the program will be executed by Bash.
#File check + user input
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

# Welcome message
echo "Welcome to the Travel Recommendation Program :)"

# Ask user for trip goal
read -p "Enter your travel goal (Education, Entertainment): " goal
goal_lower=$(echo "$goal" | tr '[:upper:]' '[:lower:]')

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
  *) echo "Invalid budget choice."; exit 1 ;;
esac

echo "Fetching suggestions for you..."
<<<<<<< HEAD
echo "--------------------------------"
=======
echo "-------------------------------—-"

##___

case $goal_lower in
  "education")

    read -p "Type of education (School/Higher): " edu_type
    
 # Convert input to lower case
    edu_type_lower=$(echo "$edu_type" | tr '[:upper:]' '[:lower:]')

  # Validate eduType & set corresponding section header
    if [[ "$edu_type_lower" == "school" ]]; then
      section="## Type: School Education"
    elif [[ "$edu_type_lower" == "higher" ]]; then
      section="## Type: Higher Education"
    else
      echo "Invalid type."
      exit 1
    fi

   ## Loop through data file & filter lines matching the selected section and budget
    print=0
    while read -r line; do
  # Start print when the section matches
      echo "$line" | grep -q "^$section$" && print=1 && continue
      
   #Stop printing if another section start
      echo "$line" | grep -q "^##" && print=0

     #If in the right section and the line is not empty
      if [ $print -eq 1 ] && [ -n "$line" ]; then
    #Extract the budget part from line
        dest_budget=$(echo "$line" | sed 's/.*- *//')
        
 ##If budget matches, extract and print the destination name
     if [ "$dest_budget" = "$budget" ]; then
          dest_name=$(echo "$line" | sed 's/-.*//')
          echo "- $dest_name"
fi
fi
    done < "$DATA_FILE"
    ;;
esac



>>>>>>> a18be0a (Ghadeer commit)
