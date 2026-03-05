#!/bin/bash

# Quick test verification for evoskills

PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
EVOSKILLS_CMD="$PROJECT_ROOT/evoskills"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

TEST_COUNT=0
PASS_COUNT=0
FAIL_COUNT=0

run_test() {
  local desc="$1"
  shift
  ((TEST_COUNT++))
  
  echo -n "[$TEST_COUNT] $desc ... "
  
  if "$@" > /dev/null 2>&1; then
    echo -e "${GREEN}✓${NC}"
    ((PASS_COUNT++))
    return 0
  else
    echo -e "${RED}✗${NC}"
    ((FAIL_COUNT++))
    return 1
  fi
}

echo -e "${YELLOW}evoskills Quick Verification${NC}"
echo "=============================="
echo ""

# Test 1-3: Basic CLI
run_test "Version command work" "$EVOSKILLS_CMD" --version
run_test "Help command works" "$EVOSKILLS_CMD" --help
run_test "Script is executable" test -x "$EVOSKILLS_CMD"

# Test 4-10: Initialization
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

run_test "Init creates structure" \
  bash -c "cd '$TEMP_DIR' && '$EVOSKILLS_CMD' init --core-only > /dev/null 2>&1 && test -d '.agent/skills'"

run_test "Constitution file downloaded" \
  bash -c "cd '$TEMP_DIR' && test -f '.github/AI_CONSTITUTION.md'"

run_test "Initialization file downloaded" \
  bash -c "cd '$TEMP_DIR' && test -f '.github/AI_INITIALIZATION.md'"

run_test "Config file created" \
  bash -c "cd '$TEMP_DIR' && test -f '.evoskills-config.json'"

run_test "Core skills installed" \
  bash -c "cd '$TEMP_DIR' && test -d '.agent/skills/_evolution-core'"

run_test "AGENTS.md registry created" \
  bash -c "cd '$TEMP_DIR' && test -f 'AGENTS.md'"

run_test "Copilot instructions created" \
  bash -c "cd '$TEMP_DIR' && test -f '.github/copilot-instructions.md'"

echo ""
echo "=============================="
echo -e "Tests: $TEST_COUNT total"
echo -e "  ${GREEN}Passed: $PASS_COUNT${NC}"
echo -e "  ${RED}Failed: $FAIL_COUNT${NC}"

if [ $FAIL_COUNT -eq 0 ]; then
  echo -e "${GREEN}✅ All tests passed!${NC}"
  exit 0
else
  echo -e "${RED}❌ Some tests failed${NC}"
  exit 1
fi

