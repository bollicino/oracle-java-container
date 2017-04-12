FROM centos
MAINTAINER Alessandro Poli <alessandro.poli@mondora.com>

# Configuration variables
ENV JAVA_VERSION 8u121
ENV BUILD b13
ENV JAVA_RPM jdk-$JAVA_VERSION-linux-x64.rpm
ENV JAVA_RPM_URL http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD/e9e7ea248e2c4826b92b3f075a80e441/$JAVA_RPM

# Install Oracle JRE
RUN yum -y install wget && \
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" $JAVA_RPM_URL  -P /tmp && \
    rpm -hiv /tmp/$JAVA_RPM && \
    rm -f /tmp/$JAVA_RPM
