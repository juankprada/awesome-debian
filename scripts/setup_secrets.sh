#!/usr/bin/env bash


if [ -z "${SECRETS_REPO}" ]; then
    echo "Error: SECRETS_REPO is not set."
    exit 1
fi

if [ -z "${PASS_REPO}" ]; then
    echo "Error: PASS_REPOE is not set."
    exit 1
fi


SECRETS_DIR="${HOME}/secrets"

if [ ! -d "$SECRETS_DIR" ]; then
    echo "Directory $TARGET_DIR does not exist. Cloning the 'secrets' repository..."
    git clone "$SECRETS_REPO" "$SECRETS_DIR"
else
    echo "Directory $TARGET_DIR already exists. Skipping."
fi

cd ${SECRETS_DIR}
echo "Restoreing Secrets"
chmod +x ./restore-secrets.sh
bash ./restore-secrets.sh


gpg-connect-agent updatestartuptty /bye

PASS_DIR="${HOME}/.password-store/"

if [ ! -d "$PASS_DIR" ]; then
    echo "Directory $TARGET_DIR does not exist. Cloning the 'password' repository..."
    git clone "$PASS_REPO" "$PASS_DIR"
else
    echo "Directory $TARGET_DIR already exists. Skipping."
fi


