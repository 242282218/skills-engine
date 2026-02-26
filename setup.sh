#!/usr/bin/env bash
# setup.sh — 将 skills-engine 链接到目标项目 (Linux / macOS)
#
# 用法：
#   bash setup.sh /path/to/my-project
#   bash setup.sh /path/to/my-project gemini claude
#   bash setup.sh /path/to/my-project gemini claude codex trae

set -euo pipefail

# ── 参数处理 ──────────────────────────────────────────────────
TARGET="${1:?用法: setup.sh <target-project-path> [platform ...]}"
ENGINE_ROOT="$(cd "$(dirname "$0")" && pwd)"
shift

# 默认全部平台
PLATFORMS=("${@:-gemini claude codex trae}")
if [ $# -eq 0 ]; then
    PLATFORMS=(gemini claude codex trae)
else
    PLATFORMS=("$@")
fi

# ── 验证目标目录 ──────────────────────────────────────────────
if [ ! -d "$TARGET" ]; then
    echo "错误：目标目录不存在：$TARGET"
    exit 1
fi
TARGET="$(cd "$TARGET" && pwd)"

echo ""
echo "skills-engine 路径：$ENGINE_ROOT"
echo "目标项目路径：$TARGET"
echo ""

# ── 辅助函数 ──────────────────────────────────────────────────

make_symlink() {
    local link_path="$1"
    local target_path="$2"
    if [ -e "$link_path" ] || [ -L "$link_path" ]; then
        echo "  [跳过] 已存在：$link_path"
    else
        ln -s "$target_path" "$link_path"
        echo "  [Symlink] $link_path → $target_path"
    fi
}

ensure_dir() {
    mkdir -p "$1"
}

# ── 各平台链接逻辑 ────────────────────────────────────────────

for platform in "${PLATFORMS[@]}"; do
    case "$platform" in

        gemini)
            echo "[Gemini]"
            ensure_dir "$TARGET/.gemini"
            make_symlink "$TARGET/.gemini/skills" "$ENGINE_ROOT/skills"
            make_symlink "$TARGET/GEMINI.md" "$ENGINE_ROOT/adapters/GEMINI.md"
            ;;

        claude)
            echo "[Claude Code]"
            make_symlink "$TARGET/CLAUDE.md" "$ENGINE_ROOT/adapters/CLAUDE.md"
            ;;

        codex)
            echo "[Codex CLI]"
            make_symlink "$TARGET/AGENTS.md" "$ENGINE_ROOT/adapters/AGENTS.md"
            ;;

        trae)
            echo "[Trae]"
            # Trae 共享 AGENTS.md
            make_symlink "$TARGET/AGENTS.md" "$ENGINE_ROOT/adapters/AGENTS.md"
            # Trae 专属规则文件
            ensure_dir "$TARGET/.trae/rules"
            TRAE_RULES="$TARGET/.trae/rules/project_rules.md"
            if [ ! -f "$TRAE_RULES" ]; then
                cat > "$TRAE_RULES" <<EOF
# Project Rules

<!-- 由 skills-engine/setup.sh 自动生成 -->
<!-- 如需自定义规则，直接在此文件追加，不要删除下方引用注释 -->

<!-- 个人规则见：$ENGINE_ROOT/core/RULES.md -->
<!-- 编码约定见：$ENGINE_ROOT/core/CONVENTIONS.md -->
EOF
                echo "  [生成] $TRAE_RULES"
            else
                echo "  [跳过] 已存在：$TRAE_RULES"
            fi
            ;;

        *)
            echo "[警告] 未知平台：$platform（可选：gemini, claude, codex, trae）"
            ;;
    esac
done

echo ""
echo "完成！"
echo ""
