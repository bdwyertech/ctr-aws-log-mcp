FROM python:3.12-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/awslabs/Log-Analyzer-with-MCP /opt/log-analyzer

RUN pip install uv
WORKDIR /opt/log-analyzer
RUN uv sync

CMD uv run src/cw-mcp-server/server.py 
