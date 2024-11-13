FROM ubuntu:20.04

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    libjson-c-dev \
    libzmq3-dev \
    libssl-dev \
    uuid-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies and build
RUN chmod +x scripts/install_dependencies.sh && \
    ./scripts/install_dependencies.sh && \
    chmod +x scripts/build.sh && \
    ./scripts/build.sh Release

# Expose ports
EXPOSE 8080

# Set entrypoint
ENTRYPOINT ["./build/bin/stream_processor_exe"]
