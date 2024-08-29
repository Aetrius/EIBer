#!/bin/bash
curl --header "PRIVATE-TOKEN: glpat-Ss9Vv_cYW5M6ox56xEjk" \
     --retry 5 \
     --retry-connrefused \
     --output SLE-Micro.x86_64-5.5.0-Default-RT-SelfInstall-GM2.install.iso \
     "https://gitlab.com/api/v4/projects/61162578/packages/generic/suse_enterprise/5.5.0/SLE-Micro.x86_64-5.5.0-Default-RT-SelfInstall-GM2.install.iso"
