#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Verifying project dependencies...${NC}"

# Check msgpack
if [ ! -d "lib/msgpack-c" ]; then
    echo -e "${YELLOW}Downloading msgpack...${NC}"
    cd lib
    git clone https://github.com/msgpack/msgpack-c.git
    cd msgpack-c
    git checkout c_master
    cd ../..
fi

# Check mongoose
if [ ! -f "lib/mongoose/mongoose.c" ]; then
    echo -e "${YELLOW}Downloading mongoose...${NC}"
    mkdir -p lib/mongoose
    cd lib/mongoose
    wget https://raw.githubusercontent.com/cesanta/mongoose/master/mongoose.c
    wget https://raw.githubusercontent.com/cesanta/mongoose/master/mongoose.h
    cd ../..
fi

# Check raft
if [ ! -d "lib/raft" ]; then
    echo -e "${YELLOW}Downloading raft...${NC}"
    cd lib
    git clone https://github.com/willemt/raft.git
    cd raft
    make
    cd ../..
fi

# Verify system libraries
echo -e "${GREEN}Checking system libraries...${NC}"
if ! pkg-config --exists json-c; then
    echo -e "${RED}json-c not found${NC}"
    exit 1
fi

if ! pkg-config --exists libzmq; then
    echo -e "${RED}ZeroMQ not found${NC}"
    exit 1
fi

echo -e "${GREEN}All dependencies verified!${NC}"
