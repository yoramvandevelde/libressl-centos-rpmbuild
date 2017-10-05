#!/bin/bash

set -x 
set -e

DISTVERSION=2.5.5

cp -v /config/libressl-centos6.specs /root/libressl-build.specs

cp -v /src/* /root/rpmbuild/SOURCES/

# Change release number
BUILDVERSION=$(cat /config/buildversion)
/bin/sed -i "s/DISTVERSION/$DISTVERSION/" /root/libressl-build.specs
/bin/sed -i "s/BUILDVERSION/$BUILDVERSION/" /root/libressl-build.specs 

# Build the RPM
/usr/bin/rpmbuild -ba /root/libressl-build.specs

# Move them to mount /data
mv -v /root/rpmbuild/RPMS/x86_64/* /data/

