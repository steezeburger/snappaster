# Snappaster justfile
# List all available commands with: just

# Default command shows all available commands
default:
    @just --list

# Test camera shutter sound
test-shutter:
    afplay camera_shutter.wav

# All tests in one command
test: test-shutter
    echo "All tests completed!"
