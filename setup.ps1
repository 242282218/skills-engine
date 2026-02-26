<#
.SYNOPSIS
    将 skills-engine 链接到目标项目

.DESCRIPTION
    为指定平台在目标项目中创建链接/文件，使 AI Agent 能自动发现 skills-engine 的内容。
    目录链接使用 Junction（无需管理员权限）；文件链接使用 SymbolicLink（需开发者模式或管理员）。

.PARAMETER TargetProject
    目标项目的路径（绝对路径）

.PARAMETER Platforms
    要链接的平台，可选：gemini, claude, codex, trae。默认全部。

.EXAMPLE
    .\setup.ps1 C:\path\to\my-project
    .\setup.ps1 C:\path\to\my-project -Platforms gemini,claude
    .\setup.ps1 C:\path\to\my-project -Platforms codex,trae
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$TargetProject,

    [string[]]$Platforms = @("gemini", "claude", "codex", "trae")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$EngineRoot = $PSScriptRoot
$Target = $TargetProject

# ── 验证目标目录 ──────────────────────────────────────────────
if (-not (Test-Path $Target -PathType Container)) {
    Write-Error "目标目录不存在：$Target"
    exit 1
}
$Target = (Resolve-Path $Target).Path

Write-Host ""
Write-Host "skills-engine 路径：$EngineRoot" -ForegroundColor DarkGray
Write-Host "目标项目路径：$Target" -ForegroundColor DarkGray
Write-Host ""

# ── 辅助函数 ──────────────────────────────────────────────────

function New-Junction {
    param([string]$LinkPath, [string]$TargetPath)
    if (Test-Path $LinkPath) {
        Write-Host "  [跳过] 已存在：$LinkPath" -ForegroundColor Yellow
        return
    }
    New-Item -ItemType Junction -Path $LinkPath -Target $TargetPath | Out-Null
    Write-Host "  [Junction] $LinkPath → $TargetPath" -ForegroundColor Green
}

function New-FileSymlink {
    param([string]$LinkPath, [string]$TargetPath)
    if (Test-Path $LinkPath) {
        Write-Host "  [跳过] 已存在：$LinkPath" -ForegroundColor Yellow
        return
    }
    try {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath | Out-Null
        Write-Host "  [Symlink] $LinkPath → $TargetPath" -ForegroundColor Green
    }
    catch {
        # 如果没有权限，回退为复制文件（并注明）
        Copy-Item -Path $TargetPath -Destination $LinkPath
        Write-Host "  [复制-无权限创建Symlink] $LinkPath ← $TargetPath" -ForegroundColor Magenta
        Write-Host "    提示：开启 Windows 开发者模式可改用 Symlink，修改后自动同步" -ForegroundColor DarkYellow
    }
}

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

# ── 各平台链接逻辑 ────────────────────────────────────────────

foreach ($platform in $Platforms) {
    switch ($platform.ToLower()) {

        "gemini" {
            Write-Host "[Gemini]" -ForegroundColor Cyan
            $geminiDir = Join-Path $Target ".gemini"
            Ensure-Dir $geminiDir
            $skillsLink = Join-Path $geminiDir "skills"
            $skillsSrc = Join-Path $EngineRoot "skills"
            New-Junction -LinkPath $skillsLink -TargetPath $skillsSrc

            # 可选：链接 GEMINI.md 到项目根（作为全局上下文补充）
            $geminiMdLink = Join-Path $Target "GEMINI.md"
            $geminiMdSrc = Join-Path $EngineRoot "adapters\GEMINI.md"
            New-FileSymlink -LinkPath $geminiMdLink -TargetPath $geminiMdSrc
        }

        "claude" {
            Write-Host "[Claude Code]" -ForegroundColor Cyan
            $claudeLink = Join-Path $Target "CLAUDE.md"
            $claudeSrc = Join-Path $EngineRoot "adapters\CLAUDE.md"
            New-FileSymlink -LinkPath $claudeLink -TargetPath $claudeSrc
        }

        "codex" {
            Write-Host "[Codex CLI]" -ForegroundColor Cyan
            $agentsLink = Join-Path $Target "AGENTS.md"
            $agentsSrc = Join-Path $EngineRoot "adapters\AGENTS.md"
            New-FileSymlink -LinkPath $agentsLink -TargetPath $agentsSrc
        }

        "trae" {
            Write-Host "[Trae]" -ForegroundColor Cyan
            # Trae 使用 AGENTS.md（项目根，与 codex 共享）
            $agentsLink = Join-Path $Target "AGENTS.md"
            $agentsSrc = Join-Path $EngineRoot "adapters\AGENTS.md"
            New-FileSymlink -LinkPath $agentsLink -TargetPath $agentsSrc

            # Trae 专属：.trae/rules/project_rules.md
            $traeRulesDir = Join-Path $Target ".trae\rules"
            Ensure-Dir $traeRulesDir
            $traeRulesFile = Join-Path $traeRulesDir "project_rules.md"
            if (-not (Test-Path $traeRulesFile)) {
                $rulesContent = @"
# Project Rules

<!-- 由 skills-engine/setup.ps1 自动生成 -->
<!-- 如需自定义规则，直接在此文件追加，不要删除下方引用注释 -->

<!-- 个人规则见：$EngineRoot\core\RULES.md -->
<!-- 编码约定见：$EngineRoot\core\CONVENTIONS.md -->
"@
                Set-Content -Path $traeRulesFile -Value $rulesContent -Encoding UTF8
                Write-Host "  [生成] $traeRulesFile" -ForegroundColor Green
            } else {
                Write-Host "  [跳过] 已存在：$traeRulesFile" -ForegroundColor Yellow
            }
        }

        default {
            Write-Host "[警告] 未知平台：$platform（可选：gemini, claude, codex, trae）" -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host "完成！" -ForegroundColor Green
Write-Host "提示：如果某文件是「复制」而非「Symlink」，更新 skills-engine 后需重新运行此脚本。" -ForegroundColor DarkGray
Write-Host ""
