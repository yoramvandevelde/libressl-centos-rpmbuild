FROM centos:centos7
LABEL version="1.0.0" \
      maintainer="Yoram van de Velde <yoram@provider.nl>"

USER root

# Copy the build script
COPY /assets/bin/build.sh /bin/build.sh

# 1. Update repos and install needed packages
# 2. Make rpmbuild directory structure
# 3. Make /bin/start.sh executable
RUN yum -y update && \
    yum clean all && \
    yum -y install gcc make wget rpm-build chrpath && \
    /bin/mkdir -pv /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}/ \
                   /data \
                   /config && \
    /bin/chmod +x /bin/build.sh
