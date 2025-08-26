#!/bin/bash
set -e

# Build the image
docker compose build

# Run the container in background
docker compose up
