#!/usr/bin/env bash

# ANSI Color Codes ==============================
RED="\033[0;91m"
GREEN="\033[0;92m"
YELLOW="\033[0;93m"
BLUE="\033[0;94m"
CYAN="\033[0;96m"
CLEAR="\033[0;0m"
# Functions =====================================

log() {
    local type="$1"
    shift
    case "$type" in
        info)    echo -e "${CYAN} [!] $* ${CLEAR}" ;;
        warn)    echo -e "${YELLOW} [!] $* ${CLEAR}" ;;
        error)   echo -e "${RED} [X] $* ${CLEAR}" >&2 ;;
        success) echo -e "${GREEN} [>] $* ${CLEAR}" ;;
    esac
}

# Install required packages
install_packages() {
    pacman -Sy
    pacman --noconfirm -S --needed git archiso github-cli p7zip
}

# Build the Arch ISO
build_iso() {
    mkarchiso -v iso/
}

# Create a zip archive of the ISO
create_zip() {
    cd out
    7z -v500m a "$(ls *.iso)".zip "$(ls *.iso)"
    md5sum * > md5sums.txt
}


# Main function
main() {
    local reponame=${PWD##*/}

    log info "Start installing packages for building $reponame ..."
    log info "Checking your OS ..."

    if command -v pacman &>/dev/null; then
            install_packages
            log success "Package Installtion completed"
            log success "Start building $reponame with archiso ..."
            build_iso
            create_zip
            log success "Building $reponame completed successfully."
    else
        log error "This OS is not Supported"
        exit 1
    fi
}

# Ensure the script is run as root ==============
[[ $EUID -ne 0 ]] && { log error "This script must be run as root."; exit 1; }

# Run the main function =========================
main
