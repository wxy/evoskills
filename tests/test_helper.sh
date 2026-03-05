#!/bin/bash

# Test helper functions for evoskills

# Get the project root directory
PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# Path to the evoskills script
EVOSKILLS_CMD="$PROJECT_ROOT/evoskills"

# Create temporary test directory
setup_test_dir() {
  local test_dir
  test_dir=$(mktemp -d)
  echo "$test_dir"
  return 0
}

# Clean up temporary test directory
cleanup_test_dir() {
  local test_dir="$1"
  if [ -d "$test_dir" ]; then
    rm -rf "$test_dir"
  fi
}

# Run evoskills command in test directory
run_evoskills() {
  local test_dir="$1"
  shift
  
  cd "$test_dir"
  "$EVOSKILLS_CMD" "$@"
  local exit_code=$?
  cd - > /dev/null
  return $exit_code
}

# Check if file exists
assert_file_exists() {
  local test_dir="$1"
  local file="$2"
  local full_path="$test_dir/$file"
  
  if [ ! -f "$full_path" ]; then
    echo "AssertionError: File not found: $full_path"
    return 1
  fi
  return 0
}

# Check if file does NOT exist
assert_file_not_exists() {
  local test_dir="$1"
  local file="$2"
  local full_path="$test_dir/$file"
  
  if [ -f "$full_path" ]; then
    echo "AssertionError: File should not exist: $full_path"
    return 1
  fi
  return 0
}

# Check if directory exists
assert_dir_exists() {
  local test_dir="$1"
  local dir="$2"
  local full_path="$test_dir/$dir"
  
  if [ ! -d "$full_path" ]; then
    echo "AssertionError: Directory not found: $full_path"
    return 1
  fi
  return 0
}

# Check file contains text
assert_file_contains() {
  local test_dir="$1"
  local file="$2"
  local text="$3"
  local full_path="$test_dir/$file"
  
  if [ ! -f "$full_path" ]; then
    echo "AssertionError: File not found: $full_path"
    return 1
  fi
  
  if ! grep -q "$text" "$full_path"; then
    echo "AssertionError: File '$full_path' does not contain '$text'"
    return 1
  fi
  return 0
}

# Check file does NOT contain text
assert_file_not_contains() {
  local test_dir="$1"
  local file="$2"
  local text="$3"
  local full_path="$test_dir/$file"
  
  if [ ! -f "$full_path" ]; then
    echo "AssertionError: File not found: $full_path"
    return 1
  fi
  
  if grep -q "$text" "$full_path"; then
    echo "AssertionError: File '$full_path' should not contain '$text'"
    return 1
  fi
  return 0
}

# Check JSON key value
assert_json_value() {
  local test_dir="$1"
  local file="$2"
  local key="$3"
  local expected_value="$4"
  local full_path="$test_dir/$file"
  
  if [ ! -f "$full_path" ]; then
    echo "AssertionError: File not found: $full_path"
    return 1
  fi
  
  # Use grep for simple JSON value checking (better portability than jq)
  local actual_value
  actual_value=$(grep "\"$key\"" "$full_path" | grep -o '"[^"]*"' | tail -1 | tr -d '"')
  
  if [ "$actual_value" != "$expected_value" ]; then
    echo "AssertionError: Expected '$key' = '$expected_value', got '$actual_value'"
    return 1
  fi
  return 0
}

# Get the number of files in a directory
count_files() {
  local dir="$1"
  if [ -d "$dir" ]; then
    find "$dir" -type f | wc -l
  else
    echo "0"
  fi
}

# Get the number of directories in a directory
count_dirs() {
  local dir="$1"
  if [ -d "$dir" ]; then
    find "$dir" -mindepth 1 -maxdepth 1 -type d | wc -l
  else
    echo "0"
  fi
}
