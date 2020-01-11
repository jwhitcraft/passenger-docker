#!/bin/bash
set -e
source /pd_build/buildconfig

#run /pd_build/install_fonts.sh

header "Installing Custom software"

run install_clean gnupg dirmngr

export GNUPGHOME="$(mktemp -d)";
for key in \
    B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 ;
do
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" ||
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ;

	gpg --batch --export "$key" > /etc/apt/trusted.gpg.d/postgres.gpg;
done
command -v gpgconf > /dev/null && gpgconf --kill all;
rm -rf "$GNUPGHOME";

PG_MAJOR='11'
PG_VERSION='11.6-1.pgdg18.04+1'

echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main $PG_MAJOR" > /etc/apt/sources.list.d/pgdg.list;
apt-get update;

run install_clean libssl1.0-dev graphicsmagick yarn tzdata postgresql-common postgresql-client-$PG_MAJOR=$PG_VERSION pgbouncer libcairo2 libgif7

run rm -f /var/log/nginx/*.log
run ln -sf /dev/stdout /var/log/nginx/access.log
run ln -sf /dev/stderr /var/log/nginx/error.log
run touch /etc/service/nginx-log-forwarder/down


header "Installing AWS CLI tools"
run pip install awscli

header "Install Bundler Version"
run gem install --no-document bundler -v '~> 1.17.3'
run gem install --no-document bundler -v '~> 2.0.2'
