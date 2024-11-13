#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Setting up test framework...${NC}"

# Create test directories if they don't exist
mkdir -p tests/unity

# Download Unity
wget https://github.com/ThrowTheSwitch/Unity/raw/master/src/unity.c -O tests/unity/unity.c
wget https://github.com/ThrowTheSwitch/Unity/raw/master/src/unity.h -O tests/unity/unity.h
wget https://github.com/ThrowTheSwitch/Unity/raw/master/src/unity_internals.h -O tests/unity/unity_internals.h

echo -e "${GREEN}Test framework setup complete${NC}"
