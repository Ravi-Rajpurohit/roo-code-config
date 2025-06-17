#!/bin/bash

# Source shared config
source "$(dirname "$0")/copy-config.env"

# Function to log messages
log_message() {
  echo "$1"
}

# Function to check if a path exists
path_exists() {
  if [ -e "$1" ]; then
    return 0
  else
    return 1
  fi
}

# Function to check if a directory is writable
directory_writable() {
  if [ -w "$1" ]; then
    return 0
  else
    return 1
  fi
}

# Function to copy files or directories
copy_path() {
  local src_path="$1"
  local dest_path="$2"

  if path_exists "$src_path"; then
    log_message "Source path $src_path exists"
  else
    log_message "Error: Path $src_path does not exist"
    return 1
  fi

  if [ -d "$src_path" ]; then
    # It's a directory
    if [ -d "$dest_path" ]; then
      log_message "Destination directory $dest_path already exists"
    else
      mkdir -p "$dest_path"
      log_message "Destination directory $dest_path created"
    fi

    if directory_writable "$dest_path"; then
      log_message "Write permissions verified for $dest_path"
    else
      log_message "Error: Write permissions not verified for $dest_path"
      return 1
    fi

    cp -r "$src_path"/* "$dest_path"
    log_message "Files copied from $src_path to $dest_path"
  else
    # It's a file
    if directory_writable "$(dirname "$dest_path")"; then
      log_message "Write permissions verified for $(dirname "$dest_path")"
    else
      log_message "Error: Write permissions not verified for $(dirname "$dest_path")"
      return 1
    fi

    cp "$src_path" "$dest_path"
    log_message "File copied from $src_path to $dest_path"
  fi

  return 0
}

# Verify the existence of the source directory
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Copy each path from DIRECTORIES_TO_COPY
for path in $DIRECTORIES_TO_COPY; do
  src_path="$SOURCE_DIR/$path"
  dest_path="./$path"

  if path_exists "$src_path"; then
    copy_path "$src_path" "$dest_path"
  else
    echo "Warning: Path '$src_path' does not exist and will be skipped."
  fi
done

# Update the "Last Updated" line in README.md if it exists
if [ -f "README.md" ]; then
  sed -i '' "s/^Last Updated: .*/Last Updated: $(date)/" README.md
else
  echo "Warning: README.md not found, skipping update."
fi
