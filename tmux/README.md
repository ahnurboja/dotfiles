# Tmux Configuration

## Overview
Tmux configuration for session management and persistent terminal environments.

## Key Bindings
- **Leader Key:** Default (Ctrl+b)
- **Navigation:** `h`, `j`, `k`, `l` (vi-style)
- **Mouse Support:** Enabled (scroll, select panes, resize).
- **Index:** Starting at 1 (for easier keyboard navigation).

## Usage
- Start new session: `tmux new -s <name>`
- List sessions: `tmux ls`
- Attach session: `tmux a -t <name>`
