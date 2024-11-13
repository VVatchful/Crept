#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Running tests...${NC}"

# Build first
./scripts/build.sh Debug

# Run tests
cd build
ctest --output-on-failure

echo -e "${GREEN}All tests completed successfully${NC}"
