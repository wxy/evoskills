# evoskills Test Suite

完整的测试套件用于验证 evoskills CLI 的功能和稳定性。

## 概览

测试套件使用 **BATS (Bash Automated Testing System)** 框架，为 bash 脚本提供清晰的测试语法。

## 文件清单

| 文件 | 用途 |
|------|------|
| `quick_test.sh` | ⚡ **快速验证脚本**（推荐） - 10 个核心测试，无外部依赖 |
| `run_tests.sh` | 完整 BATS 测试运行器 |
| `test_helper.sh` | 测试辅助函数和断言库 |
| `test_cli_basics.bats` | CLI 基本功能（8 个测试） |
| `test_init.bats` | 项目初始化（11 个测试） |
| `test_config.bats` | 配置管理（6 个测试） |
| `test_skills.bats` | 技能生命周期（11 个测试） |
| `test_update.bats` | 更新功能（10 个测试） |
| `README.md` | 本文件 |

### 测试覆盖

| 文件 | 测试内容 | 测试用例数 |
|------|--------|---------|
| `test_cli_basics.bats` | CLI 基本功能、版本、帮助 | 8 |
| `test_init.bats` | 项目初始化、框架文件下载、技能安装 | 13 |
| `test_config.bats` | 配置文件管理、JSON 格式验证 | 7 |
| `test_skills.bats` | 技能安装、移除、列表管理 | 11 |
| `test_update.bats` | 更新功能、框架文件刷新 | 10 |
| **总计** | | **49** |

## 安装和运行

### 前置要求

1. **BATS** (Bash Automated Testing System) - 可选
   ```bash
   # macOS
   brew install bats-core

   # Ubuntu/Debian
   sudo apt-get install bats

   # 或从源码安装
   git clone https://github.com/bats-core/bats-core.git
   cd bats-core && ./install.sh /usr/local
   ```

2. **Bash 4.0+**
   ```bash
   bash --version
   ```

### 快速验证（推荐）

使用无需依赖的快速测试验证核心功能：
```bash
./tests/quick_test.sh
```

**输出示例：**
```
evoskills Quick Verification
==============================

[1] Version command work ... ✓
[2] Help command works ... ✓
[3] Script is executable ... ✓
[4] Init creates structure ... ✓
[5] Constitution file downloaded ... ✓
...
Tests: 10 total
  Passed: 10
  Failed: 0
✅ All tests passed!
```

### 完整测试套件（BATS）

运行完整的 49 个测试用例：

**所有测试：**
```bash
./tests/run_tests.sh
```

**单个测试文件：**
```bash
bats tests/test_cli_basics.bats
bats tests/test_init.bats
```

**单个测试用例：**
```bash
bats tests/test_init.bats -f "init --core-only creates"
```

**详细输出：**
```bash
bats tests/test_init.bats --tap  # TAP 格式
```

## 测试文件说明

### test_cli_basics.bats
验证 CLI 的基本功能：
- 版本号检查 (`--version`, `-v`)
- 帮助显示 (`--help`, `-h`)
- 无参数行为
- 无效命令处理
- 脚本可执行性和 shebang

**示例：**
```bash
bats tests/test_cli_basics.bats
```

### test_init.bats
测试项目初始化流程：
- 创建项目结构 (`.agent/skills`)
- 下载框架文件 (`AI_CONSTITUTION.md`, `AI_INITIALIZATION.md`)
- 创建 copilot 指令文件
- 生成配置文件 (`.evoskills-config.json`)
- 安装技能包
- 生成技能注册表 (`AGENTS.md`)
- **关键**：下载失败时的错误处理
- **关键**：防止 copilot 指令重复添加

**关键测试：**
```bash
# 这个测试验证 init 在失败时不创建存根文件
bats tests/test_init.bats -f "invalid repo"

# 这个测试验证重复初始化不会污染 copilot 指令文件
bats tests/test_init.bats -f "repeated init"
```

### test_config.bats
验证配置管理：
- 配置文件生成和格式
- JSON 有效性
- skillsRepo 字段
- installedAt 时间戳
- openskillsCompatible 标志
- 自定义仓库 URL 支持

### test_skills.bats
测试技能生命周期管理：
- 列出可用技能 (`evoskills list`)
- 列出已安装技能 (`evoskills list --installed`)
- 安装技能 (`evoskills install`)
- 移除技能 (`evoskills remove`)
- 安装别名 (`evoskills add`)
- 批量安装 (逗号分隔列表)
- 全部安装 (`--all`)
- AGENTS.md 更新

### test_update.bats
验证更新功能：
- **关键**：无条件刷新 `AI_CONSTITUTION.md`
- **关键**：无条件刷新 `AI_INITIALIZATION.md`
- 刷新已安装技能
- 按名称更新单个技能
- 更改仓库配置 (`--repo`)
- 完成信息显示

**关键测试验证修改文件在 update 后被恢复：**
```bash
bats tests/test_update.bats -f "unconditionally"
```

## 测试辅助函数

在 `test_helper.sh` 中定义的辅助函数：

```bash
# 目录管理
setup_test_dir()           # 创建临时测试目录
cleanup_test_dir()         # 清理测试目录

# 文件验证
assert_file_exists()       # 检查文件存在
assert_file_not_exists()   # 检查文件不存在
assert_file_contains()     # 检查文件内容
assert_file_not_contains() # 检查文件不包含内容

# 目录验证
assert_dir_exists()        # 检查目录存在

# JSON 验证
assert_json_value()        # 检查 JSON 键值

# 计数
count_files()              # 统计文件数
count_dirs()               # 统计目录数
```

## 输出示例

**成功运行：**
```
Running evoskills test suite...

Running test_cli_basics.bats...
 ✓ version flag shows current version
 ✓ version short flag -v shows current version
 ✓ help flag displays usage information
 ...
✅ test_cli_basics.bats passed

Running test_init.bats...
 ✓ init --core-only creates project structure
 ✓ init downloads constitution file
 ...
✅ test_init.bats passed

✅ All tests passed!
```

**失败运行：**
```
Running test_init.bats...
 ✓ init --core-only creates project structure
 ✗ init downloads invalid content
 ...
❌ test_init.bats failed

❌ 1 test file(s) failed
```

## 常见问题

### Q: 如何调试失败的测试？
```bash
# 使用 BATS 的详细输出
bats tests/test_init.bats --verbose

# 或在 test 文件中添加 debug 命令
@test "my test" {
  run echo "debug info"
  echo "Status: $status"
  echo "Output: $output"
}
```

### Q: 测试可以在 CI/CD 中运行吗？
是的，完全支持在 CI/CD 管道中运行：
```bash
# GitHub Actions
- name: Run tests
  run: ./tests/run_tests.sh

# GitLab CI
script:
  - ./tests/run_tests.sh
```

### Q: 如何添加新测试？
1. 在相应的 `.bats` 文件中添加 `@test` 块
2. 使用断言函数验证行为
3. 使用 `run` 命令捕获输出和退出代码

**示例：**
```bash
@test "my new feature works" {
  run bash -c "cd '$TEST_DIR' && '$EVOSKILLS_CMD' my-command"
  [ $status -eq 0 ]
  [[ "$output" == *"expected output"* ]]
}
```

## 测试的关键场景

### 1. 严格的初始化错误处理
```bash
# 无效仓库不应创建存根文件
evoskills init --repo https://github.com/invalid/repo
# → exit code != 0, no empty files created
```

### 2. 无条件框架文件更新
```bash
# 修改文件后运行 update
echo "MODIFIED" > .github/AI_CONSTITUTION.md
evoskills update
# → 文件被恢复到最新版本
```

### 3. 防止重复污染
```bash
# 重复运行 init
evoskills init --core-only
evoskills init --core-only
# → copilot-instructions.md 没有被追加重复内容
```

## 贡献新测试

1. **遵循现有结构**：将测试添加到适当的 `.bats` 文件
2. **清晰的测试说明**：使用描述性的 `@test` 标签
3. **使用辅助函数**：复用 `test_helper.sh` 中的函数
4. **临时目录隔离**：使用 `setup()` 和 `teardown()` 管理测试环境
5. **验证关键行为**：专注于用户可观察的结果

## 测试统计

```
Total Test Files:    5
Total Test Cases:    49
Coverage:
  ✓ CLI 功能
  ✓ 项目初始化
  ✓ 配置管理
  ✓ 技能生命周期
  ✓ 更新机制
  ✓ 错误处理
  ✓ 文件生成
  ✓ 数据验证
```

## 相关文件

- [evoskills CLI 脚本](../evoskills)
- [项目 README](../README.md)
- [BATS 文档](https://bats-core.readthedocs.io/)
