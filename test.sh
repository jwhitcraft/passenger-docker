#!/bin/bash
set -ex

export GNUPGHOME="$(mktemp -d)";
for key in \
    B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8;
do
    gpg --keyserver hkp://144.76.9.122:80 --recv-keys "$key" ||
    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" ||
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" ||
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ;
done

rm -rf "$GNUPGHOME";
