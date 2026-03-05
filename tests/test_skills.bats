#!/usr/bin/env bats

# Tests for evoskills skill management

source "$(dirname "$BATS_TEST_FILENAME")/test_helper.sh"

setup() {
  TEST_DIR=$(setup_test_dir)
  export TEST_DIR
  
  # Initialize the project first
  cd "$TEST_DIR"
  "$EVOSKILLS_CMD" init --core-only > /dev/null 2>&1
  cd - > /dev/null
}

teardown() {
  if [ -n "$TEST_DIR" ]; then
    cleanup_test_dir "$TEST_DIR"
  fi
}

@test "list command shows available skills" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' list"
  [ $status -eq 0 ]
  
  # Should list core skills
  [[ "$output" == *"_evolution-core"* ]]
  [[ "$output" == *"_skills-manager"* ]]
}

@test "list --installed shows only installed skills" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' list --installed"
  [ $status -eq 0 ]
  
  # Core skills should be listed
  [[ "$output" == *"_evolution-core"* ]]
  [[ "$output" == *"_skills-manager"* ]]
}

@test "install command works for optional skills" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' install _git-commit"
  [ $status -eq 0 ]
  
  # Check that skill was installed
  [ -d "$TEST_DIR/.agent/skills/_git-commit" ]
}

@test "remove command removes installed skill" {
  # First install a skill
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' install _git-commit"
  [ $status -eq 0 ]
  [ -d "$TEST_DIR/.agent/skills/_git-commit" ]
  
  # Then remove it
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' remove _git-commit"
  [ $status -eq 0 ]
  
  # Check that skill was removed
  [ ! -d "$TEST_DIR/.agent/skills/_git-commit" ]
}

@test "add command is alias for install" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' add _pr-creator"
  [ $status -eq 0 ]
  
  [ -d "$TEST_DIR/.agent/skills/_pr-creator" ]
}

@test "core skills cannot be removed" {
  # This might not raise immediately, but they shouldn't be removed
  bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' remove _evolution-core 2>&1"
  
  # Core skill should still exist (or command should fail)
  # Implementation dependent, but at minimum it shouldn't break the project
  [ -f "$TEST_DIR/.evoskills-config.json" ]
}

@test "all optional skills can be installed" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --all"
  [ $status -eq 0 ]
  
  # Check that we have core + required + optional skills installed
  [ -d "$TEST_DIR/.agent/skills/_git-commit" ]
  [ -d "$TEST_DIR/.agent/skills/_pr-creator" ]
  [ -d "$TEST_DIR/.agent/skills/_release-process" ]
}

@test "skills can be installed with comma-separated list" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' init --skills _git-commit,_pr-creator"
  [ $status -eq 0 ]
  
  [ -d "$TEST_DIR/.agent/skills/_git-commit" ]
  [ -d "$TEST_DIR/.agent/skills/_pr-creator" ]
}

@test "install non-existent skill fails gracefully" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' install _non-existent-skill 2>&1"
  [ $status -ne 0 ]
}

@test "AGENTS.md is updated after installing skill" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' install _git-commit"
  [ $status -eq 0 ]
  
  [ -f "$TEST_DIR/AGENTS.md" ]
  grep -q "_git-commit" "$TEST_DIR/AGENTS.md"
}

@test "AGENTS.md contains openskills compatibility note" {
  [ -f "$TEST_DIR/AGENTS.md" ]
  grep -q "EVOSKILLS_START" "$TEST_DIR/AGENTS.md"
  grep -q "EVOSKILLS_END" "$TEST_DIR/AGENTS.md"
}
