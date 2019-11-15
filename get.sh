#!/bin/sh

OS=$(uname -s)
ARCH=$(uname -m)
VERSION="v0.17.0"

echo "Downloading Semaphore CLI release ${VERSION} for ${OS}_${ARCH} ..."
echo ""

curl --fail -L "https://github.com/semaphoreci/cli/releases/download/${VERSION}/sem_${OS}_${ARCH}.tar.gz" -o /tmp/sem.tar.gz

if ! [ $? -eq 0 ]; then
  echo ""
  echo "[error] Failed to download Sem CLI release for $OS $ARCH."
  echo ""
  echo "Supported versions of the Semaphore CLI are:"
  echo " - Linux_x86_64"
  echo " - Linux_i386"
  echo " - Darwin_i386"
  echo " - Darwin_x86_64"
  echo ""
  exit 1
fi

tar -xzf /tmp/sem.tar.gz -C /tmp
sudo chmod +x /tmp/sem
sudo mv /tmp/sem /usr/local/bin/

echo ""
echo "Semaphore CLI ${VERSION} for ${OS}_${ARCH} installed."
