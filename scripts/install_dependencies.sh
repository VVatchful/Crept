#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Setting up development environment...${NC}"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Create lib directory if it doesn't exist
mkdir -p lib

# Delete existing msgpack installation if it exists
if [ -d "lib/msgpack-c" ]; then
    echo -e "${YELLOW}Removing existing msgpack installation...${NC}"
    rm -rf lib/msgpack-c
fi

# Clone and build msgpack
echo -e "${GREEN}Building msgpack...${NC}"
cd lib
git clone https://github.com/msgpack/msgpack-c.git
cd msgpack-c
git checkout c_master

# Create build directory and build
mkdir -p build
cd build
cmake .. \
    -DMSGPACK_BUILD_EXAMPLES=OFF \
    -DMSGPACK_BUILD_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release

make -j$(nproc)
sudo make install
sudo ldconfig
cd ../..

# Download mongoose
echo -e "${GREEN}Downloading mongoose...${NC}"
mkdir -p mongoose
cd mongoose
wget https://raw.githubusercontent.com/cesanta/mongoose/master/mongoose.c
wget https://raw.githubusercontent.com/cesanta/mongoose/master/mongoose.h
cd ..

# Clone and build raft
echo -e "${GREEN}Building raft...${NC}"
if [ ! -d "raft" ]; then
    git clone https://github.com/willemt/raft.git
fi
cd raft
make clean
make
cd ..

# Return to project root
cd ..

echo -e "${GREEN}Dependencies installed successfully!${NC}"
echo -e "${YELLOW}You can now build the project using:${NC}"
echo -e "    ./scripts/build.sh"
