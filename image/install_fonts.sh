#!/bin/bash
set -e
source /pd_build/buildconfig

header "Installing Custom Fonts"

run install_clean curl software-properties-common
run add-apt-repository -y ppa:mitradranirban/fonts-mukti
run echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
run install_clean fontconfig \
    fonts-liberation \
    fonts-liberation2 \
    fonts-lohit-* \
    fonts-opensymbol \
    fonts-arkpandora \
    fonts-dejavu \
    fonts-tlwg-garuda \
    fonts-arphic-gkai00mp \
    fonts-arphic-uming \
    fonts-arphic-ukai \
    fonts-arphic-gbsn00lp \
    fonts-takao \
    fonts-takao-mincho \
    fonts-ipafont-gothic \
    fonts-ipafont-mincho \
    fonts-mukti \
    fonts-unfonts-core \
    ttf-mscorefonts-installer \
    fonts-beng \
    fonts-baekmuk

run curl -L -o /tmp/dejavu-lgc-fonts-ttf-2.37.tar.bz2 https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-lgc-fonts-ttf-2.37.tar.bz2
run tar xjf /tmp/dejavu-lgc-fonts-ttf-2.37.tar.bz2 -C /tmp
run mkdir -p /usr/share/fonts/truetype/dejavu-lgc
run cp /tmp/dejavu-lgc-fonts-ttf-2.37/ttf/*.ttf /usr/share/fonts/truetype/dejavu-lgc
run rm -rf /tmp/dejavu-lgc-fonts-ttf-2.37*
run mkdir -p /usr/share/fonts/truetype/kochi/
run curl -L -o /usr/share/fonts/truetype/kochi/kochi-mincho-subst.ttf https://github.com/indico/indico-fonts/raw/master/indico_fonts/kochi-mincho-subst.ttf
run curl -L -o /usr/share/fonts/truetype/kochi/kochi-gothic-subst.ttf https://github.com/indico/indico-fonts/raw/master/indico_fonts/kochi-gothic-subst.ttf
run fc-cache -v -f
