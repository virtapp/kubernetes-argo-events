#!/bin/bash

set -e

ROLE=$1
VERSION=$2

echo "[INFO] Installing K3s as $ROLE with version $VERSION"

if [ "$ROLE" == "server" ]; then
  curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="$VERSION" sh -
else
  echo "[ERROR] This script supports only server role for now."
  exit 1
fi

echo "[INFO] K3s installation complete."
