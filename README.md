# snappaster

A program for MacOS to take a picture with your webcam and put the path in clipboard,
for easy image use with Claude Code and maybe other ai tooling

## Setup

1. Make the script executable:
   ```sh
   chmod +x snappaster
   ```

2. Install dependencies:
   ```sh
   brew install imagesnap
   ```

## Configuration

* Default save location is `$HOME/Pictures/snappaster-snapshots`
* Customize save location by setting the `SNAPSHOT_DIR` environment variable:
  * Create or edit the `.env` file with your preferred location:
    ```sh
    SNAPSHOT_DIR=$HOME/your/custom/path
    ```
  * Or set temporarily when running:
    ```sh
    SNAPSHOT_DIR=/path/to/snapshots ./snappaster
    ```

## Usage

* `snappaster` script - takes screenshot, puts path in clipboard
  * takes screenshot with `imagesnap` - https://github.com/rharder/imagesnap
  * convert jpg to png with `sips` - https://ss64.com/mac/sips.html
  * puts path in clipboard with `pbcopy`
* can be used with `skhd` for hotkey - https://github.com/koekeishiya/skhd
  ```sh
  # editing config
  vim ~/.config/skhd
  # start and stop daemon
  skhd --start-service
  skhd --stop-service
  # restart daemon
  skhd --restart-service
  # reload config
  skhd --reload
  ```
* nice to use with a macropad
  * can bind a key on macropad to call the keyboard shortcut defined w/ skhd
