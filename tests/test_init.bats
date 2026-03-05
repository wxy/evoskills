#!/usr/bin/env bats

# Tests for evoskills init command

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

@test "init --core-only creates project structure" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  # Check that .agent/skills directory exists
  [ -d "$TEST_DIR/.agent" ]
  [ -d "$TEST_DIR/.agent/skills" ]
}

@test "init --core-only downloads constitution file" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  # Check that AI_CONSTITUTION.md was downloaded
  [ -f "$TEST_DIR/.github/AI_CONSTITUTION.md" ]
  grep -q "AI Evolution Constitution" "$TEST_DIR/.github/AI_CONSTITUTION.md"
}

@test "init --core-only downloads initialization file" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  # Check that AI_INITIALIZATION.md was downloaded
  [ -f "$TEST_DIR/.github/AI_INITIALIZATION.md" ]
  grep -q "Initialization Protocol" "$TEST_DIR/.github/AI_INITIALIZATION.md"
}

@test "init --core-only creates copilot-instructions.md" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  [ -f "$TEST_DIR/.github/copilot-instructions.md" ]
  grep -q "AI_CONSTITUTION.md" "$TEST_DIR/.github/copilot-instructions.md"
  grep -q "AI_INITIALIZATION.md" "$TEST_DIR/.github/copilot-instructions.md"
}

@test "init creates .evoskills-config.json" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  [ -f "$TEST_DIR/.evoskills-config.json" ]
  grep -q "skillsRepo" "$TEST_DIR/.evoskills-config.json"
  grep -q "https://github.com/wxy/evoskills" "$TEST_DIR/.evoskills-config.json"
}

@test "init --core-only installs core skills" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  # Check that core skills are installed
  [ -d "$TEST_DIR/.agent/skills/_evolution-core" ]
  [ -d "$TEST_DIR/.agent/skills/_skills-manager" ]
}

@test "init creates AGENTS.md registry" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  [ -f "$TEST_DIR/AGENTS.md" ]
  grep -q "_evolution-core" "$TEST_DIR/AGENTS.md"
  grep -q "_skills-manager" "$TEST_DIR/AGENTS.md"
}

@test "init with invalid repo URL fails without creating files" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only --repo 'https://github.com/invalid/repo' 2>&1"
  [ $status -ne 0 ]
  
  # Should not create stub files
  if [ -f "$TEST_DIR/.github/AI_CONSTITUTION.md" ]; then
    [ ! -s "$TEST_DIR/.github/AI_CONSTITUTION.md" ] # File should be empty (not created)
  fi
}

@test "init --required-only installs core and required skills" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --required-only"
  [ $status -eq 0 ]
  
  # Check core skills
  [ -d "$TEST_DIR/.agent/skills/_evolution-core" ]
  [ -d "$TEST_DIR/.agent/skills/_skills-manager" ]
  
  # Check required skills
  [ -d "$TEST_DIR/.agent/skills/_instruction-guard" ]
  [ -d "$TEST_DIR/.agent/skills/_context-ack" ]
  [ -d "$TEST_DIR/.agent/skills/_file-output-guard" ]
  [ -d "$TEST_DIR/.agent/skills/_execution-precheck" ]
}

@test "init displays success message" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  [[ "$output" == *"Initialization complete"* ]]
}

@test "repeated init does not duplicate copilot-instructions entries" {
  # First init
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  local first_size=$(wc -l < "$TEST_DIR/.github/copilot-instructions.md")
  
  # Second init
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --core-only"
  [ $status -eq 0 ]
  
  local second_size=$(wc -l < "$TEST_DIR/.github/copilot-instructions.md")
  
  # File size should not significantly increase (no duplication)
  [ $second_size -eq $first_size ]
}
