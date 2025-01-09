#!/bin/bash

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

# Counter for deleted files
deleted_count=0

# Use find to locate files ending with :Zone.Identifier
while IFS= read -r -d '' file; do
    echo "Deleting: $file"
    rm "$file"
    ((deleted_count++))
done < <(find "$main_dir" -type f -name '*:Zone.Identifier' -print0)

echo "Finished deleting $deleted_count Zone.Identifier file(s) in $main_dir and its subdirectories."
