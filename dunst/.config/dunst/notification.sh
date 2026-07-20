#!/usr/bin/env bash

# Count unread history items
COUNT=$(dunstctl count history)

if [ "$COUNT" -gt 0 ]; then
    # Output valid JSON for Waybar
    echo "{\"text\": \" <span foreground='red'><sup></sup></span>\", \"tooltip\": \"$COUNT unread notifications\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"No notifications\"}"
fi
