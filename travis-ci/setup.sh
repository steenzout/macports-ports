#!/bin/bash

git clone --depth 1 git@github.com:MacPython/terryfy.git

source terryfy/travis_tools.sh

MACPORTS_VERSION=2.4.1

func setup {
    local osx_version=$(get_osx_version)
    local vers_name=$(osx_version2version_name $osx_version)
    local macports_pkg=MacPorts-$MACPORTS_VERSION-${vers_name}.pkg
    local macports_path=$DOWNLOADS_SDIR/$macports_pkg

    mkdir -p $DOWNLOADS_SDIR
    curl -L $MACPORTS_URL/$macports_pkg > $macports_path
    require_success "failed to download macports"
    sudo installer -pkg $macports_path -target /
    require_success "failed to install macports"
    PATH=$MACPORTS_PREFIX/bin:$PATH
}
