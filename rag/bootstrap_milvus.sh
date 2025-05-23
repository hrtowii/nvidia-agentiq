#!/bin/bash

# SPDX-FileCopyrightText: Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# python ${CUR_DIR}/langchain_web_ingest.py
# python ${CUR_DIR}/langchain_web_ingest.py --urls https://github.com/modelcontextprotocol/python-sdk \
#     --urls https://modelcontextprotocol.io/introduction \
#     --urls https://modelcontextprotocol.io/quickstart/server \
#     --urls https://modelcontextprotocol.io/quickstart/client --urls https://modelcontextprotocol.io/examples --urls https://modelcontextprotocol.io/docs/concepts/architecture --collection_name=mcp_docs

python ${CUR_DIR}/langchain_web_ingest.py \
    --urls https://docs.nvidia.com/agentiq/latest/intro/install.html \
    --urls https://docs.nvidia.com/agentiq/latest/intro/get-started.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/create-customize-workflows.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/sharing-workflows-and-tools.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/evaluate.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/custom-evaluator.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/observe-workflow-with-phoenix.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/using-agentiq-ui-and-server.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/profiler.html \
    --urls https://docs.nvidia.com/agentiq/latest/guides/adding-an-llm-provider.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/functions.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/workflow-configuration.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/profiler.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/evaluate.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/memory.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/observability.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/cli.html \
    --urls https://docs.nvidia.com/agentiq/latest/concepts/plugins.html \
    --urls https://docs.nvidia.com/agentiq/latest/components/react-agent.html \
    --urls https://docs.nvidia.com/agentiq/latest/components/reasoning-agent.html \
    --urls https://docs.nvidia.com/agentiq/latest/components/tool-calling-agent.html \
    --urls https://docs.nvidia.com/agentiq/latest/components/retriever.html \
    --urls https://docs.nvidia.com/agentiq/latest/components/mcp.html \
    --urls https://docs.nvidia.com/agentiq/latest/components/code-execution.html \
    --urls https://docs.nvidia.com/agentiq/latest/references/interactive-models.html \
    --collection_name=nvidia_aiq_docs
