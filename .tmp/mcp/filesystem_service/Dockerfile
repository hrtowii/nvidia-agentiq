FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# Install Python and pip and npx (for exa-server)
RUN echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4 && \
    echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf.d/99no-recommends && \
    echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/99no-recommends && \
    echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99no-languages && \
    echo 'Acquire::http::Pipeline-Depth 10;' > /etc/apt/apt.conf.d/99custom && \
    echo 'Acquire::http::Timeout "10";' >> /etc/apt/apt.conf.d/99custom && \
    echo 'Acquire::https::Timeout "10";' >> /etc/apt/apt.conf.d/99custom && \
    grep -q "precedence ::ffff:0:0/96" /etc/gai.conf && \
    sed -i 's/^#precedence ::ffff:0:0\/96  100/precedence ::ffff:0:0\/96  100/' /etc/gai.conf || \
    echo "precedence ::ffff:0:0/96 100" >> /etc/gai.conf

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl gnupg python3 python3-pip ca-certificates

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs
# Install MCP proxy and tools
RUN pip3 install uv uvx
RUN pip3 install "mcp==1.5.0"
RUN pip3 install "mcp-proxy==0.5.1"

# Create directory for scripts
RUN mkdir /scripts

# Set the entrypoint to run the MCP proxy
ENTRYPOINT ["mcp-proxy", "--pass-environment"]
