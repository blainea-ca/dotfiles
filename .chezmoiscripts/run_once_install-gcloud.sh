#!/bin/sh
# Install Google Cloud SDK to ~/google-cloud-sdk (auto-discovered by OMZ gcloud plugin).
# Updates: `gcloud components update`.
set -e

[ -x "$HOME/google-cloud-sdk/bin/gcloud" ] && exit 0

echo "==> Installing Google Cloud SDK to ~/google-cloud-sdk..."
curl -fsSL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-arm.tar.gz \
  | tar -xz -C "$HOME"

"$HOME/google-cloud-sdk/install.sh" \
  --quiet \
  --usage-reporting=false \
  --command-completion=false \
  --path-update=false \
  --rc-path=/dev/null \
  --install-python=false
