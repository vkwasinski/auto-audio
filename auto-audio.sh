#!/usr/bin/env bash

# auto-audio.sh
# Selects the last added (most recently updated) audio sink and source
# Works on PulseAudio/PipeWire

set -euo pipefail

# Get last output device added (sink)
last_sink=$(pactl list short sinks | tail -n 1 | awk '{print $2}')

# Get the last input device, ignore monitor 
last_source=$(pactl list short sources | grep -v ".monitor" | tail -n 1 | awk '{print $2}')

if [[ -n "$last_sink" ]]; then
  echo "Setting default output (sink) to: $last_sink"
  pactl set-default-sink "$last_sink"

  # Move all current audio streams to the new sink
  for input in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$input" "$last_sink"
  done
fi

if [[ -n "$last_source" ]]; then
  echo "Setting default input (source) to: $last_source"
  pactl set-default-source "$last_source"
fi
