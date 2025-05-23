#!/usr/bin/env bash
#
# run_all.sh — start all MCP workflow scripts in parallel

# Determine the directory where this script lives
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker compose -f rag/docker-compose.yaml up -d
# Launch each service script in the background
bash "${BASE_DIR}/code-exec.sh"   &
bash "${BASE_DIR}/exa-mcp.sh"     &
bash "${BASE_DIR}/filesystem-mcp.sh" &
bash "${BASE_DIR}/terminal.sh"    &

# Wait for all background jobs
wait

echo "✅ All services have exited."
