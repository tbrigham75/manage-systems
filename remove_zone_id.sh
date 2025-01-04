#!/bin/bash

# Function to search and delete Zone.Identifier files
delete_zone_identifier() {
    local dir="$1"
    find "$dir" -type f -name '*Zone.Identifier' -delete
    echo "Deleted Zone.Identifier files in $dir"
}

# Check if a directory is provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide a directory path as an argument."
    exit 1
fi

# Main directory to start the search
main_dir="$1"

# Check if the provided path is a directory
if [ ! -d "$main_dir" ]; then
    echo "Error: $main_dir is not a valid directory."
    exit 1
fi

# Loop through each subdirectory
for subdir in "$main_dir"/*/ ; do
    if [ -d "$subdir" ]; then
        delete_zone_identifier "$subdir"
    fi
done

echo "Finished searching and deleting Zone.Identifier files."

