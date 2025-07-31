
#!/bin/bash

set -e

ROLE=$1
VERSION=$2

LOGFILE="install_k3s.log"
exec > >(tee -i $LOGFILE)
exec 2>&1

if [ -z "$VERSION" ]; then
  echo "[ERROR] K3s version is required. Usage: ./install_k3s.sh <server|agent> <version>"
  exit 1
fi

echo "[INFO] Installing K3s as $ROLE with version $VERSION"

# Common K3s install options
DISABLE_OPTIONS="--disable local-storage --disable traefik"

if [ "$ROLE" == "server" ]; then
  curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="$VERSION" sh -s - $DISABLE_OPTIONS
  echo "[INFO] K3s server installation complete."

  # Export kubeconfig
  mkdir -p ~/.kube
  sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
  sudo chown $USER:$USER ~/.kube/config
  echo "[INFO] kubeconfig copied to ~/.kube/config"

elif [ "$ROLE" == "agent" ]; then
  if [ -z "$K3S_URL" ] || [ -z "$K3S_TOKEN" ]; then
    echo "[ERROR] K3S_URL and K3S_TOKEN environment variables must be set for agent."
    exit 1
  fi
  curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="$VERSION" K3S_URL="$K3S_URL" K3S_TOKEN="$K3S_TOKEN" sh -
  echo "[INFO] K3s agent installation complete."

else
  echo "[ERROR] Unsupported role: $ROLE. Use 'server' or 'agent'."
  exit 1
fi
