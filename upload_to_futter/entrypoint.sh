#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /upload_to_futter/tmp/pids/server.pid

# Execute the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
