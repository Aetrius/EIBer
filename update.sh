#!/bin/bash
UPLOAD_TOKEN=""
BINARY_VERSION="5.5.0"
curl -v -H \
  "PRIVATE-TOKEN: $UPLOAD_TOKEN" \
  --progress-bar \
  -o output.txt \
  --upload-file "SLE-Micro.x86_64-5.5.0-Default-RT-SelfInstall-GM2.install.iso" \
  "https://gitlab.com/api/v4/projects/61162578/packages/generic/suse_enterprise/$BINARY_VERSION/SLE-Micro.x86_64-5.5.0-Default-RT-SelfInstall-GM2.install.iso"