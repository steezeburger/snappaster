# Snappaster justfile
# List all available commands with: just

# Default command shows all available commands
default:
    @just --list

# Test camera shutter sound
test-shutter:
    afplay camera_shutter.wav

# Test that imagesnap can list cameras
test-camera:
    @echo "Testing camera detection..."
    @if imagesnap -l | grep -q '=>'; then echo "✓ Cameras detected"; else echo "✗ No cameras found"; exit 1; fi

# Test dependencies are installed
test-deps:
    @echo "Testing dependencies..."
    @command -v imagesnap >/dev/null && echo "✓ imagesnap found" || (echo "✗ imagesnap missing"; exit 1)
    @command -v sips >/dev/null && echo "✓ sips found" || (echo "✗ sips missing"; exit 1)
    @command -v pbcopy >/dev/null && echo "✓ pbcopy found" || (echo "✗ pbcopy missing"; exit 1)
    @command -v afplay >/dev/null && echo "✓ afplay found" || (echo "✗ afplay missing"; exit 1)

# Test taking actual snapshot
test-snapshot:
    @echo "Testing snapshot functionality..."
    @TEST_DIR="/tmp/snappaster-test" && \
     SNAPSHOT_DIR="$$TEST_DIR" ./snappaster >/dev/null 2>&1 && \
     if ls "$$TEST_DIR"/*.png >/dev/null 2>&1; then echo "✓ Snapshot created successfully"; rm -rf "$$TEST_DIR"; else echo "✗ Snapshot creation failed"; exit 1; fi

# All tests in one command
test: test-deps test-camera test-snapshot test-shutter
    @echo "✓ All tests passed!"
