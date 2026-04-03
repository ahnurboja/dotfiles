# Gemini CLI Operational Context: Dotfiles

This file defines the foundational architecture and maintenance protocols for this repository. Adhere to these mandates for all modifications.

## Architectural Mandates
- **Source of Truth:** All configuration files MUST reside in a subdirectory (Stow Package) within this repository. NEVER modify files in the home directory (`~`) directly.
- **Symlink Management:** Use [GNU Stow] for all symlinking. The `setup.sh` script is the orchestrator for these links.
- **Package Structure:** 
  - Each top-level directory (e.g., `zsh/`, `git/`) is a "Package."
  - Files inside a package are mirrored exactly to the home directory (e.g., `zsh/.zshrc` -> `~/.zshrc`).

## Maintenance Protocols
### 1. Adding a New Tool/Configuration
When tasked with adding a new tool (e.g., `tmux`, `nvim`):
1. **Identify Type:** Determine if it's a Homebrew Formula or Cask.
2. **Update Brewfile:** Append the entry to `Brewfile`.
3. **Create Package:** Create a new directory (e.g., `tmux/`) and place the config file(s) inside.
4. **Update setup.sh:** Add the new package name to the `stow` command list in `setup.sh`.

### 2. Modifying Existing Configuration
- Always locate the file within its respective package directory (e.g., `git/.gitconfig`) before editing.
- After a structural change (moving/renaming files), verify the `stow` command in `setup.sh` is still accurate.

## Mapping Reference
- **Zsh:** `zsh/.zshrc` (mirrors to `~/.zshrc`)
- **Git:** `git/.gitconfig` (mirrors to `~/.gitconfig`)
- **Gemini:** `gemini/GEMINI.md` (mirrors to `~/GEMINI.md`)
- **Automation:** `setup.sh` (Entry point for bootstrapping)
- **Dependency List:** `Brewfile` (Homebrew manifest)

## Tooling Context
- **VS Code:** Integration is handled via `google.gemini-cli-vscode-ide-companion`. Installation logic is managed in `setup.sh`.
