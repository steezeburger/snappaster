# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Snappaster is a screenshot utility for macOS that takes webcam snapshots and copies the file path to the clipboard for easy use with AI tooling like Claude Code. The workflow captures a JPG image, converts it to PNG, and puts the PNG path in the clipboard.

## Core Architecture

- `snappaster` - Main bash script that orchestrates the screenshot workflow
- `snapshots/` - Directory where captured images are stored with timestamp filenames
- `camera_shutter.wav` - Audio feedback file played when screenshot is taken
- `justfile` - Task runner with common development commands

## Dependencies

The project relies on macOS command-line tools:
- `imagesnap` - Camera capture (https://github.com/rharder/imagesnap)
- `sips` - Image format conversion (built into macOS)
- `pbcopy` - Clipboard operations (built into macOS)
- `afplay` - Audio playback (built into macOS)

## Common Commands

List all available commands:
```bash
just
```

Test camera shutter sound:
```bash
just test-shutter
```

Run all tests:
```bash
just test
```

Manual script execution:
```bash
./snappaster
```

## Integration Notes

- Designed to work with `skhd` hotkey daemon for keyboard shortcuts
- Camera device may need adjustment for different webcams (use `imagesnap -l` to list available devices)
- Save directory configurable via SNAPSHOT_DIR environment variable or .env file
- File naming uses timestamp format: `snapshot_YYYY-MM-DD_HH-MM-SS.png`

## Claude Code Guidelines

- Always ensure empty new lines in files you touch or create
