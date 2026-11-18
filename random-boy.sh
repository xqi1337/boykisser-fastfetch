#!/usr/bin/env zsh

LOGO_DIR="$HOME/.config/fastfetch/boykisser"
CONFIG_FILE="$HOME/.config/fastfetch/boykisser/boy.jsonc"

SELECTED_LOGO=$(find "$LOGO_DIR" -type f -name "*.txt" | shuf -n 1)

if [[ -z "$SELECTED_LOGO" ]]; then
  print -u2 "No .txt ASCII logo found in $LOGO_DIR"
  exit 1
fi

jq --arg logoPath "$SELECTED_LOGO" \
   '.logo.source = $logoPath | .logo.type = "file-raw"' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
fastfetch -c "$CONFIG_FILE"
