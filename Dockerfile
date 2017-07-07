FROM phusion/baseimage:0.9.22
MAINTAINER support@pushtechnology.com

# Put everything in /opt
WORKDIR /opt

# Install JDK 8u131
RUN curl http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm -o java.rpm --cookie oraclelicense=accept-securebackup-cookie -L && \
  rpm -ivh java.rpm && \
rm java.rpm

RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define default command.
CMD ["/sbin/my_init", "/bin/bash"]
