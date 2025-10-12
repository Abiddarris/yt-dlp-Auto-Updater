#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

GITHUB_API="https://api.github.com/repos/yt-dlp/yt-dlp/releases/latest"
INSTALL_PATH="/usr/local/bin/yt-dlp"
TMP_PATH="/tmp/yt-dlp-latest"
ARCHIVE_NAME="yt-dlp"

echo -e "${YELLOW}[INFO] Checking latest yt-dlp version from GitHub...${RESET}"

LATEST_VERSION=$(curl -s "$GITHUB_API" | grep '"tag_name":' | cut -d '"' -f4)

if [ -z "$LATEST_VERSION" ]; then
    echo -e "${RED}[ERROR] Failed to fetch latest version.${RESET}"
    exit 1
fi

echo -e "${GREEN}[INFO] Latest yt-dlp version: $LATEST_VERSION${RESET}"

if [ -x "$INSTALL_PATH" ]; then
    INSTALLED_VERSION=$("$INSTALL_PATH" --version | head -n1)
    echo -e "${GREEN}[INFO] Installed yt-dlp version: $INSTALLED_VERSION${RESET}"
else
    echo -e "${YELLOW}[WARN] No existing yt-dlp found in $INSTALL_PATH${RESET}"
    INSTALLED_VERSION="none"
fi

if [ "$LATEST_VERSION" = "$INSTALLED_VERSION" ]; then
    echo -e "${GREEN}[INFO] yt-dlp is already up-to-date.${RESET}"
    exit 0
fi

echo -e "${YELLOW}[INFO] New version available. Downloading...${RESET}"

DOWNLOAD_URL="https://github.com/yt-dlp/yt-dlp/releases/download/${LATEST_VERSION}/yt-dlp"
curl -L "$DOWNLOAD_URL" -o "$TMP_PATH"
chmod +x "$TMP_PATH"

echo -e "${GREEN}[INFO] Download complete. Installing with pkexec...${RESET}"

pkexec cp "$TMP_PATH" "$INSTALL_PATH"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[SUCCESS] yt-dlp updated to $LATEST_VERSION${RESET}"
else
    echo -e "${RED}[ERROR] Failed to copy yt-dlp to /usr/local/bin. Check permissions.${RESET}"
    exit 1
fi

rm "$TMP_PATH"
