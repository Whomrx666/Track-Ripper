#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

check_installation() {
    if ! command -v "$1" &> /dev/null
    then
        echo -e "${RED}Error: $1 not found!${NC}"
        return 1
    else
        echo -e "${GREEN}$1 is already installed.${NC}"
        return 0
    fi
}

echo -e "${CYAN}Checking if Python and pip are installed...${NC}"

check_installation python3
if [ $? -ne 0 ]; then
    echo -e "${RED}Python3 is not installed. Please install Python3 first.${NC}"
    exit 1
fi

check_installation pip3
if [ $? -ne 0 ]; then
    echo -e "${RED}pip3 is not installed. Please install pip3 first.${NC}"
    exit 1
fi

echo -e "${GREEN}All base packages are installed.${NC}"
echo -e "${CYAN}Starting dependency installation...${NC}"

pip3 install Flask requests rich pycountry

if [ $? -eq 0 ]; then
    echo -e "${GREEN}All dependencies installed successfully!${NC}"
else
    echo -e "${YELLOW}There was an issue installing with pip3.${NC}"
    echo -e "${CYAN}Trying alternative installation method...${NC}"

    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install python3-pip python3-dev
        pip3 install Flask requests rich pycountry
    elif command -v pkg &> /dev/null; then
        pkg update
        pkg install python
        pip install Flask requests rich pycountry
    else
        echo -e "${RED}Unable to identify the package manager system.${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}Installation complete! All dependencies are installed. Type (make run) to start.${NC}"