#!/bin/bash

export SERVICE_NAME=terminal
# This can be any name you want to give to your service.
export SERVICE_BRIEF_NAME=terminal
export SERVICE_DIR=./.tmp/mcp/${SERVICE_BRIEF_NAME}_service
export CONTAINER_NAME=mcp-proxy-aiq-${SERVICE_BRIEF_NAME}
export SERVER_PORT=9904 #8080 is taken for me by searxng
rm -rf ${SERVICE_DIR}
mkdir -p ${SERVICE_DIR}
cp ./Dockerfile ${SERVICE_DIR}/

cat > ${SERVICE_DIR}/run_service.sh <<EOF
#!/bin/bash
export ALLOW_COMMANDS="ls,cat,pwd,grep,wc,touch,find"
uvx run mcp-shell-server
EOF
chmod +x ${SERVICE_DIR}/run_service.sh

cat > ${SERVICE_DIR}/docker-compose.yml <<EOF
services:
  ${SERVICE_BRIEF_NAME}_server:
    container_name: ${CONTAINER_NAME}
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "${SERVER_PORT}:${SERVER_PORT}"
    volumes:
      - ./run_service.sh:/scripts/run_service.sh
    command:
      - "--sse-port=${SERVER_PORT}"
      - "--sse-host=0.0.0.0"
      - "/scripts/run_service.sh"
EOF
# docker compose -f ${SERVICE_DIR}/docker-compose.yml build --no-cache
docker compose -f ${SERVICE_DIR}/docker-compose.yml up

docker ps
# docker logs -f ${CONTAINER_NAME}
