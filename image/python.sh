#!/bin/bash
set -e
source /pd_build/buildconfig

header "Installing Python..."

## Install Python.
minimal_apt_get_install python3-distutils

curl -sS https://bootstrap.pypa.io/get-pip.py | python3
