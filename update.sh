#!/bin/bash
UPLOAD_TOKEN="glpat-Ss9Vv_cYW5M6ox56xEjk"
BINARY_VERSION="6.0.0"
curl -v -H \
  "PRIVATE-TOKEN: $UPLOAD_TOKEN" \
  --progress-bar \
  -o output.txt \
  --upload-file "SL-Micro-6.0-Packages-x86_64-GM.iso" \
  "https://gitlab.com/api/v4/projects/61162578/packages/generic/suse_enterprise/$BINARY_VERSION/SL-Micro-6.0-Packages-x86_64-GM.iso"