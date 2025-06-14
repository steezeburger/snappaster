# snappaster

A program for MacOS to take a picture with your webcam and put the path in clipboard,
for easy image use with Claude Code and maybe other ai tooling. Or set `SNAPSHOT_DIR`
to a directory in your repo and use your editor's ai tools to work with the images.

![Demo](screens/screen1.png)

## Setup

1. Make the script executable:
   ```sh
   cd snappaster
   chmod +x snappaster
   ```

2. Install dependencies:
   ```sh
   brew install imagesnap
   ```

## Configuration

* Default save location is `$HOME/Pictures/snappaster-snapshots`
* Camera device is auto-detected from available webcams
* Customize settings by setting environment variables:
  * Create or edit the `.env` file:
    ```sh
    SNAPSHOT_DIR=$HOME/your/custom/path
    CAMERA_DEVICE="Your Webcam Name"
    ```
  * Or set temporarily when running:
    ```sh
    SNAPSHOT_DIR=/path/to/snapshots CAMERA_DEVICE="FaceTime HD Camera" ./snappaster
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

## Common Issues

- Can't find your webcam device name?
```shell
imagesnap -l
```
Then set the exact name as an environment variable:
```shell
CAMERA_DEVICE="FaceTime HD Camera" ./snappaster
```

## Example Use Cases

**Development & Tech:**
- Whiteboard diagrams → Claude Code generates code diagrams (mermaid, ASCII art, etc.)
- Handwritten notes → Digital todo lists and task tracking
- Meeting whiteboards → Structured summaries and action items
- Code sketches → Implementation planning

**Creative & Design:**
- Hand sketches → Digital mockups and wireframes
- Color palettes from real objects → CSS/design system generation
- Typography samples → Font identification and pairing suggestions
- Layout ideas → HTML/CSS implementation

**Learning & Education:**
- Textbook problems → Step-by-step solutions
- Handwritten math → LaTeX formatting
- Language practice (signs, menus) → Translation and grammar explanations
- Research notes → Bibliography and citation formatting

**Work & Productivity:**
- Business cards → Contact info extraction and CRM entry
- Receipt photos → Expense tracking and categorization
- Flowcharts → Process documentation
- Sticky note brainstorms → Organized project plans

**Home & Life:**
- Plant problems → Care diagnosis and solutions
- Error messages/screens → Troubleshooting guides
- Product labels → Ingredient analysis and alternatives
- Handwritten addresses → Map directions and contact info
- Ingredients photo → Recipe suggestions and cooking instructions
- Fridge contents → Grocery lists and meal planning
- Handwritten lists → Digital organization and reminders

**Creative Problem Solving:**
- Mind maps → Structured analysis
- Broken items → Repair instructions
- Assembly diagrams → Step-by-step guides
- Garden layouts → Planting schedules and care tips
