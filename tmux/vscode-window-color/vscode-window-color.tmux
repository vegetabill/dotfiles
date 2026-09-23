#!/usr/bin/env bash
# vscode-window-color — tint the current tmux window tab using the
# titleBar.activeBackground color from the repo's .vscode/settings.json.
#
# Load from .tmux.conf with:
#   run-shell '~/dotfiles/tmux/vscode-window-color/vscode-window-color.tmux'

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SCRIPT="$CURRENT_DIR/scripts/set_window_color.sh"

run="run-shell -b '$SCRIPT \"#{pane_current_path}\" \"#{window_id}\"'"

# Register hooks once per server to avoid piling up duplicates on reload.
if [ -z "$(tmux show-option -gqv '@vscode_window_color_loaded')" ]; then
  for event in \
    pane-focus-in \
    after-select-window \
    after-new-window \
    after-split-window \
    session-window-changed; do
    tmux set-hook -ga "$event" "$run"
  done
  tmux set-option -g '@vscode_window_color_loaded' '1'
fi

# Bind prefix + V to re-evaluate the current window on demand (e.g. after a cd).
tmux bind-key V run-shell -b "$SCRIPT"

# Color every existing window on load.
for w in $(tmux list-windows -F '#{window_id}'); do
  p="$(tmux display-message -p -t "$w" '#{pane_current_path}')"
  "$SCRIPT" "$p" "$w" || true
done
