#!/bin/bash

# Verify the existence of the source directory
SOURCE_DIR="../roo-code"
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Use rsync to copy only .roomodes and .roo folders/files from source directory to current directory
rsync -av --include='.roomodes/***' --include='.roo/***' --exclude='*' "$SOURCE_DIR/." .
if [ $? -ne 0 ]; then
  echo "Error: Failed to copy files from '$SOURCE_DIR'."
  exit 1
fi

# Update the "Last Updated" line in README.md
sed -i '' "s/^Last Updated: .*/Last Updated: $(date)/" README.md

