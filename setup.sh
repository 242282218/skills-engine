#!/usr/bin/env bash
# setup.sh — 将 skills-engine 链接到目标项目 (Linux / macOS)
#
# 用法:
#   bash setup.sh /path/to/my-project
#   bash setup.sh /path/to/my-project --platforms gemini,claude

set -euo pipefail

TARGET="${1:?用法: setup.sh <target-project-path>}"
ENGINE_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "[skills-engine] 开始链接 → $TARGET"

# TODO: 实现各平台链接逻辑
# gemini  → <target>/.gemini/skills/ symlink → $ENGINE_ROOT/skills/
# claude  → <target>/CLAUDE.md symlink       → $ENGINE_ROOT/adapters/CLAUDE.md
# codex   → <target>/AGENTS.md symlink       → $ENGINE_ROOT/adapters/AGENTS.md
# trae    → <target>/.trae/rules/ 生成 project_rules.md

echo "[skills-engine] 链接完成"
