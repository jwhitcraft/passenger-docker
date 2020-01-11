#!/bin/bash
set -e
source /pd_build/buildconfig

header "Preparing APT repositories"

## Phusion Passenger
#run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
#if [[ "$PASSENGER_ENTERPRISE" ]]; then
#	echo "+ Enabling Passenger Enterprise APT repo"
#	echo deb https://download:$PASSENGER_ENTERPRISE_DOWNLOAD_TOKEN@www.phusionpassenger.com/enterprise_apt bionic main > /etc/apt/sources.list.d/passenger.list
#else
#	echo "+ Enabling Passenger APT repo"
#	echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list
#fi

echo "+ Enabling nginx APT repo"

run apt-key add /pd_build/nginx-packages.gpg.key
echo deb https://s3.amazonaws.com/untappd-nginx stable main > /etc/apt/sources.list.d/nginx.list

echo "+ Enabling yarn apt repo"
run curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo deb http://dl.yarnpkg.com/debian/ stable main > /etc/apt/sources.list.d/yarn.list

run apt-get update
