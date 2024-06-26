#!/bin/bash

# Function to detect the Linux distribution and install Git
install_git() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
    fi

    case "$OS" in
        "Ubuntu"|"Debian")
            echo "Detected $OS. Installing Git using apt..."
            sudo apt -qq update
            sudo apt -qq install -y git
            ;;
        "CentOS Linux"|"Red Hat Enterprise Linux")
            echo "Detected $OS. Installing Git using yum..."
            sudo yum install -y git
            ;;
        *)
            echo "Unsupported operating system. Please install Git manually."
            exit 1
            ;;
    esac
}

# Function to verify if Git is installed
verify_git_installation() {
    if command -v git &> /dev/null; then
        echo "Git successfully installed! Version:"
        git --version
    else
        echo "Failed to install Git."
        exit 1
    fi
}

# Execute the functions
install_git
verify_git_installation
