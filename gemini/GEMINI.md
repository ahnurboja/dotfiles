# Gemini CLI Operational Context: Dotfiles

This file defines the foundational architecture and maintenance protocols for the **dotfiles repository**. These mandates apply ONLY when the agent is performing tasks related to environment configuration or modifying the contents of `~/Projects/dotfiles`.

## Architectural Mandates
- **Source of Truth:** All configuration files MUST reside in a subdirectory (Stow Package) within this repository. NEVER modify files in the home directory (`~`) directly.
- **Symlink Management:** Use [GNU Stow] for all symlinking. The `setup.sh` script is the orchestrator for these links.
- **Package Structure:** 
  - Each top-level directory (e.g., `zsh/`, `git/`) is a "Package."
  - Files inside a package are mirrored exactly to the home directory (e.g., `zsh/.zshrc` -> `~/.zshrc`).

## Maintenance Protocols

### 1. Adding/Modifying Tools
When tasked with adding a new tool or changing configuration:
1.  **Modify Source:** Make all changes inside the repository packages (e.g., `zsh/`, `git/`).
2.  **Brewfile:** If it's a new tool, add the formula/cask to `Brewfile`.
3.  **setup.sh Updates:** 
    - If a new package directory is created, add it to the `stow` command list.
    - If the tool requires post-install steps (e.g., VS Code extensions, initialization scripts), add those steps to the end of `setup.sh`.
4.  **Apply Changes:** Run `./setup.sh` to ensure symlinks are updated and post-install steps are executed.
5.  **Documentation:** Update `README.md` if the change adds new functionality or tools that the user should be aware of.

### 2. Synchronization (Pushing)
- **Scope:** This protocol applies ONLY to the `dotfiles` repository.
- **Action:** Every successful modification to this repository (code change + verification) MUST be committed and pushed to the remote repository (`origin main`) automatically.
- Use descriptive commit messages (e.g., "Add tmux package and update setup.sh").

### 3. Verification
- After running `./setup.sh`, verify that the symlinks in `~` point correctly to the files in this repository.

## Mapping Reference
- **Zsh:** `zsh/.zshrc` (mirrors to `~/.zshrc`)
- **Git:** `git/.gitconfig` (mirrors to `~/.gitconfig`)
- **Gemini:** `gemini/GEMINI.md` (mirrors to `~/GEMINI.md`)
- **Automation:** `setup.sh` (Entry point for bootstrapping)
- **Dependency List:** `Brewfile` (Homebrew manifest)

## Tooling Context
- **VS Code:** Integration is handled via `google.gemini-cli-vscode-ide-companion`. Installation logic is managed in `setup.sh`.
