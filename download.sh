#!/bin/bash
curl --header "PRIVATE-TOKEN: " \
     --retry 5 \
     --retry-connrefused \
     --output SL-Micro-6.0-Packages-x86_64-GM.iso \
     "https://gitlab.com/api/v4/projects/61162578/packages/generic/suse_enterprise/6.0.0/SL-Micro-6.0-Packages-x86_64-GM.iso"
