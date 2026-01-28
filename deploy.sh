#!/bin/bash

# Deploy script to sync Exar Notes content from /Documents/Exar Notes/Blog to Hugo project
# This script copies markdown files and images to the proper Hugo structure

set -e  # Exit on error

# Configuration
SOURCE_DIR="$HOME/Documents/Exar Notes/Blog"
HUGO_ROOT="$(cd "$(dirname "$0")" && pwd)"
CONTENT_DIR="$HUGO_ROOT/content/posts"
STATIC_IMAGES_DIR="$HUGO_ROOT/static/images"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    log_error "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

log_info "Starting Exar Notes deployment from $SOURCE_DIR"

# Create target directories if they don't exist
log_info "Creating target directories..."
mkdir -p "$CONTENT_DIR"
mkdir -p "$STATIC_IMAGES_DIR"

# Clean existing content to ensure fresh sync
log_info "Cleaning existing Exar Notes content..."
if [ -d "$CONTENT_DIR" ]; then
    rm -rf "$CONTENT_DIR"/*
    log_info "Removed old markdown files from $CONTENT_DIR"
fi

if [ -d "$STATIC_IMAGES_DIR" ]; then
    rm -rf "$STATIC_IMAGES_DIR"/*
    log_info "Removed old images from $STATIC_IMAGES_DIR"
fi

# Copy markdown files
log_info "Copying markdown files..."
MD_COUNT=0
if compgen -G "$SOURCE_DIR/*.md" > /dev/null; then
    for file in "$SOURCE_DIR"/*.md; do
        if [ -f "$file" ]; then
            cp "$file" "$CONTENT_DIR/"
            ((MD_COUNT++))
            log_info "Copied: $(basename "$file")"
        fi
    done
    log_info "Copied $MD_COUNT markdown file(s)"
else
    log_warn "No markdown files found in $SOURCE_DIR"
fi

# Copy images folder
log_info "Copying images..."
if [ -d "$SOURCE_DIR/images" ]; then
    cp -r "$SOURCE_DIR/images/"* "$STATIC_IMAGES_DIR/" 2>/dev/null || log_warn "Images folder is empty"
    IMAGE_COUNT=$(find "$STATIC_IMAGES_DIR" -type f 2>/dev/null | wc -l)
    log_info "Copied $IMAGE_COUNT image file(s)"
else
    log_warn "Images directory not found: $SOURCE_DIR/images"
fi

# Summary
echo ""
log_info "========================================="
log_info "Deployment Summary:"
log_info "  Markdown files: $MD_COUNT"
log_info "  Images: ${IMAGE_COUNT:-0}"
log_info "  Content location: $CONTENT_DIR"
log_info "  Images location: $STATIC_IMAGES_DIR"
log_info "========================================="
log_info "Exar Notes deployment complete!"

# Smokecheck build - verify Hugo can build successfully
log_info "Running smokecheck build..."
cd "$HUGO_ROOT"
if hugo; then
    log_info "Smokecheck build successful! Site would build correctly."
    # Clean up the build output since it's just a smokecheck
    rm -rf "$HUGO_ROOT/public"
    log_info "Cleaned up smokecheck build output"
else
    log_error "Smokecheck build failed! Please fix errors before deploying."
    exit 1
fi

# Git operations
log_info "Committing changes to git..."

# Check if there are any changes to commit
if git diff --quiet && git diff --staged --quiet; then
    log_warn "No changes to commit"
else
    # Add content and static changes only (not public/)
    git add content/ static/
    
    # Create commit with timestamp
    COMMIT_MSG="Update Exar Notes - $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MSG"
    log_info "Created commit: $COMMIT_MSG"
    
    # Push to GitHub
    log_info "Pushing to GitHub..."
    git push
    log_info "Successfully pushed to GitHub!"
fi

echo ""
log_info "========================================="
log_info "All done! Your Exar Notes changes are ready!"
log_info "Note: The VPS will build the public directory on deployment"
log_info "========================================="
