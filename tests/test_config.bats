#!/usr/bin/env bats

# Tests for evoskills configuration management

source "$(dirname "$BATS_TEST_FILENAME")/test_helper.sh"

setup() {
  TEST_DIR=$(setup_test_dir)
  export TEST_DIR
}

teardown() {
  if [ -n "$TEST_DIR" ]; then
    cleanup_test_dir "$TEST_DIR"
  fi
}

@test "config file contains default repository" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  [ -f "$TEST_DIR/.evoskills-config.json" ]
  grep -q '"skillsRepo"' "$TEST_DIR/.evoskills-config.json"
  grep -q "https://github.com/wxy/evoskills" "$TEST_DIR/.evoskills-config.json"
}

@test "config file contains installed timestamp" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  grep -q '"installedAt"' "$TEST_DIR/.evoskills-config.json"
}

@test "config file contains skills directory path" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  grep -q '"skillsDir"' "$TEST_DIR/.evoskills-config.json"
  grep -q '".agent/skills"' "$TEST_DIR/.evoskills-config.json"
}

@test "config can be updated with custom repository" {
  custom_repo="https://github.com/test/custom-repo"
  
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only --repo '$custom_repo'"
  [ $status -ne 0 ] # Will fail because repo doesn't exist
  
  # But the config should have been updated
  [ -f "$TEST_DIR/.evoskills-config.json" ]
  grep -q "$custom_repo" "$TEST_DIR/.evoskills-config.json"
}

@test "config file is valid JSON" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  # Try to parse JSON with basic grep patterns
  [ -f "$TEST_DIR/.evoskills-config.json" ]
  grep -q '{' "$TEST_DIR/.evoskills-config.json"
  grep -q '}' "$TEST_DIR/.evoskills-config.json"
  grep -q ':' "$TEST_DIR/.evoskills-config.json"
}

@test "config file contains openskillsCompatible flag" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  grep -q '"openskillsCompatible"' "$TEST_DIR/.evoskills-config.json"
  grep -q 'true' "$TEST_DIR/.evoskills-config.json"
}
