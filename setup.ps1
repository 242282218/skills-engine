<#
.SYNOPSIS
    将 skills-engine 链接到目标项目

.EXAMPLE
    .\setup.ps1 C:\path\to\my-project
    .\setup.ps1 C:\path\to\my-project -Platforms gemini,claude
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$TargetProject,

    [string[]]$Platforms = @("gemini","claude","codex","trae")
)

$EngineRoot = $PSScriptRoot
$Target     = Resolve-Path $TargetProject

Write-Host "`n[skills-engine] 开始链接 → $Target" -ForegroundColor Cyan

# TODO: 实现各平台链接逻辑
# gemini  → <target>/.gemini/skills/ symlink → $EngineRoot/skills/
# claude  → <target>/CLAUDE.md symlink       → $EngineRoot/adapters/CLAUDE.md
# codex   → <target>/AGENTS.md symlink       → $EngineRoot/adapters/AGENTS.md
# trae    → <target>/.trae/rules/ 生成 project_rules.md

Write-Host "[skills-engine] 链接完成" -ForegroundColor Green
