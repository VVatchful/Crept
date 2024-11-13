#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Default build type
BUILD_TYPE=${1:-Release}

echo -e "${GREEN}Building stream processing system...${NC}"
echo -e "${YELLOW}Build type: ${BUILD_TYPE}${NC}"

# Create build directory
mkdir -p build
cd build

# Configure
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..

# Build
cmake --build . -- -j$(nproc)

echo -e "${GREEN}Build completed successfully${NC}"
