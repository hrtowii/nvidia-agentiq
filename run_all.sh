#!/usr/bin/env bash
#
# run_all.sh — start all MCP workflow scripts in parallel

# Determine the directory where this script lives
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker compose -f rag/docker-compose.yaml up -d

# Function to run a script and echo when it's done
run_script() {
  bash "$1"
  echo "$(basename $1) has finished"
}

# Launch each service script in the background
run_script "${BASE_DIR}/code-exec.sh" &
run_script "${BASE_DIR}/exa-mcp.sh" &
run_script "${BASE_DIR}/filesystem-mcp.sh" &
run_script "${BASE_DIR}/terminal.sh" &

# Wait for all background jobs
wait

echo "All services have exited: Run the following command to watch logs:
docker logs -f mcp-proxy-aiq-exa
docker logs -f mcp-proxy-aiq-code-exec
docker logs -f mcp-proxy-aiq-filesystem
docker logs -f mcp-proxy-aiq-terminal"