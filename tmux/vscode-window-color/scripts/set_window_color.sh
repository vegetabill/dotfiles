#!/usr/bin/env bash
# Color the tmux window tab based on .vscode/settings.json -> titleBar.activeBackground
# of the git repo root containing the active pane's working directory.
#
# Usage: set_window_color.sh [pane_current_path] [window_id]
# Args are optional; falls back to querying tmux for the active pane/window.

set -euo pipefail

path="${1:-}"
win="${2:-}"

# Fall back to the active pane / current window if not passed by the hook.
[ -z "$path" ] && path="$(tmux display-message -p '#{pane_current_path}' 2>/dev/null || true)"
[ -z "$win" ]  && win="$(tmux display-message -p '#{window_id}' 2>/dev/null || true)"

[ -z "$win" ] && exit 0
[ -z "$path" ] && path="$HOME"

# Clear any per-window overrides this plugin previously set, restoring the
# global (catppuccin) styling for windows without a .vscode color.
clear_overrides() {
  tmux set-option  -wu -t "$win" window-status-current-format 2>/dev/null || true
  tmux set-option  -wu -t "$win" window-status-format         2>/dev/null || true
  tmux set-option  -wu -t "$win" window-status-style          2>/dev/null || true
  tmux set-option  -wu -t "$win" window-status-current-style  2>/dev/null || true
  tmux set-option  -wu -t "$win" pane-border-style            2>/dev/null || true
  tmux set-option  -wu -t "$win" pane-active-border-style     2>/dev/null || true
}

# Locate the repo root for the pane's directory (fall back to the dir itself).
root="$(git -C "$path" rev-parse --show-toplevel 2>/dev/null || echo "$path")"
settings="$root/.vscode/settings.json"

if [ ! -f "$settings" ]; then
  clear_overrides
  exit 0
fi

# Extract workbench.colorCustomizations -> titleBar.activeBackground.
# settings.json is JSONC, so strip // and /* */ comments and trailing commas
# before handing it to jq.
color="$(
  sed -e 's@//[^"]*$@@' "$settings" \
    | jq -r '.["workbench.colorCustomizations"]["titleBar.activeBackground"] // empty' 2>/dev/null \
    || true
)"

# Fallback: tolerate richer JSONC via python if jq came up empty.
if [ -z "$color" ]; then
  color="$(
    python3 - "$settings" <<'PY' 2>/dev/null || true
import json, re, sys
raw = open(sys.argv[1], encoding="utf-8").read()
raw = re.sub(r'/\*.*?\*/', '', raw, flags=re.S)
raw = re.sub(r'//[^\n]*', '', raw)
raw = re.sub(r',(\s*[}\]])', r'\1', raw)
try:
    d = json.loads(raw)
    print(d.get("workbench.colorCustomizations", {}).get("titleBar.activeBackground", ""))
except Exception:
    pass
PY
  )"
fi

if [ -z "$color" ]; then
  clear_overrides
  exit 0
fi

# Normalize to #rrggbb (drop alpha / expand shorthand) and pick a readable fg.
hex="${color#\#}"
case "${#hex}" in
  3) hex="${hex:0:1}${hex:0:1}${hex:1:1}${hex:1:1}${hex:2:1}${hex:2:1}" ;;
esac
hex="${hex:0:6}"
if ! [[ "$hex" =~ ^[0-9a-fA-F]{6}$ ]]; then
  clear_overrides
  exit 0
fi
bg="#${hex}"
r=$((16#${hex:0:2})); g=$((16#${hex:2:2})); b=$((16#${hex:4:2}))
lum=$(( (r*299 + g*587 + b*114) / 1000 ))
if [ "$lum" -gt 140 ]; then fg="#000000"; else fg="#ffffff"; fi

# Rounded end-caps matching catppuccin's rounded window style.
# U+E0B6 () = left cap, U+E0B4 () = right cap. Emit the bytes via printf so
# they survive editors and work on macOS bash 3.2 (no $'\u' support).
lcap="$(printf '\356\202\266')"
rcap="$(printf '\356\202\264')"

# Active tab: leading marker star + bold so the focused window stands out even
# among several same-colored tabs. Inactive tabs are dimmed.
cur="#[fg=${bg},bg=default]${lcap}#[fg=${fg},bg=${bg},bold]★ #I #W #[fg=${bg},bg=default,nobold]${rcap}"
ina="#[fg=${bg},bg=default]${lcap}#[fg=${fg},bg=${bg}] #I #W #[fg=${bg},bg=default]${rcap}"

tmux set-option -w -t "$win" window-status-current-format "$cur"
tmux set-option -w -t "$win" window-status-format         "$ina"

# Color the pane borders for this window to match its tab color, so the whole
# terminal is "framed" in the active window's color. The active pane gets the
# full color; inactive panes get a dimmed version of the same hue.
dim_r=$(( r/2 )); dim_g=$(( g/2 )); dim_b=$(( b/2 ))
dim="$(printf '#%02x%02x%02x' "$dim_r" "$dim_g" "$dim_b")"
tmux set-option -w -t "$win" pane-active-border-style "fg=${bg}"
tmux set-option -w -t "$win" pane-border-style        "fg=${dim}"
