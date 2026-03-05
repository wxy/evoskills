#!/bin/bash

# Test runner for evoskills
# This script runs the BATS test suite

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if BATS is installed
if ! command -v bats &> /dev/null; then
  echo -e "${YELLOW}⚠️  BATS is not installed. Installing...${NC}"
  
  if command -v brew &> /dev/null; then
    brew install bats-core
  elif command -v apt-get &> /dev/null; then
    sudo apt-get install -y bats
  else
    echo -e "${RED}❌ Please install BATS manually:${NC}"
    echo "   macOS: brew install bats-core"
    echo "   Linux: apt-get install bats (or equivalent)"
    exit 1
  fi
fi

echo -e "${GREEN}Running evoskills test suite...${NC}"
echo ""

# Run all test files
test_files=(
  "test_cli_basics.bats"
  "test_init.bats"
  "test_config.bats"
  "test_skills.bats"
  "test_update.bats"
)

failed_tests=0
total_tests=0

for test_file in "${test_files[@]}"; do
  test_path="$SCRIPT_DIR/$test_file"
  if [ -f "$test_path" ]; then
    echo -e "${YELLOW}Running $test_file...${NC}"
    if bats "$test_path"; then
      echo -e "${GREEN}✅ $test_file passed${NC}"
    else
      echo -e "${RED}❌ $test_file failed${NC}"
      ((failed_tests++))
    fi
    echo ""
  fi
done

if [ $failed_tests -eq 0 ]; then
  echo -e "${GREEN}✅ All tests passed!${NC}"
  exit 0
else
  echo -e "${RED}❌ $failed_tests test file(s) failed${NC}"
  exit 1
fi
