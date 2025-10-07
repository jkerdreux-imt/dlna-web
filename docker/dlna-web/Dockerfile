FROM debian:trixie AS builder
ENV LANG=C.UTF-8

# Install build dependencies
RUN apt-get update && apt-get -y install pipx gcc && rm -rf /var/lib/apt/lists/*

# Install uv globally
RUN pipx install uv

# Set working directory
WORKDIR /opt/dlna-web

# Copy application source code and requirements
COPY src ./src
COPY requirements.txt .

# Setup Python environment and install dependencies
RUN ~/.local/bin/uv python install 3.8
RUN ~/.local/bin/uv python pin 3.8
RUN ~/.local/bin/uv venv --seed
RUN .venv/bin/pip install -r requirements.txt

# Stage 2: Runtime
FROM debian:trixie-slim
ENV LANG=C.UTF-8

# Copy only the necessary files from the builder stage
COPY --from=builder /opt/dlna-web /opt/dlna-web
COPY --from=builder /root/.local/share/uv/ /root/.local/share/uv/ 

# Copy the run script
COPY docker/dlna-web/files/run.sh /opt/dlna-web/

# Set the working directory and command
WORKDIR /opt/dlna-web
CMD ["/opt/dlna-web/run.sh"]
