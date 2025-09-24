# auto-audio
I was really tired of linux messing up audio channels while I was in meetings and connecting devices

Usage:

Save as ~/.local/bin/auto-audio.sh

Make it executable:
chmod +x ~/.local/bin/auto-audio.sh

Run it manually after plugging a new device:
auto-audio.sh

Optional automation:

udev rule → trigger when a new USB audio device connects.

systemd service → run automatically on device change.

Or bind to a hotkey in your desktop environment.
