FROM debian:jessie

# Install bashc tools
RUN apt-get update && \
    apt-get install -y screen vim nano curl man && \
    apt-get clean

# Install SSH Daemon
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# # Install bzip2 for level3
# RUN apt-get install -y bzip2

# # Install MariaDB for level5
# RUN echo 'mysql-server mysql-server/root_password password wololo' | debconf-set-selections
# RUN echo 'mysql-server mysql-server/root_password_again password wololo' | debconf-set-selections
# RUN apt-get install -y python-software-properties
# RUN apt-get install -y software-properties-common
# RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
# RUN add-apt-repository 'deb http://mariadb.biz.net.id/repo/10.2/debian jessie main'
# RUN apt-get update
# RUN apt-get install -y mariadb-server mariadb-client

# Install cron for level6
# RUN apt-get update && apt-get install -y cron

# Install the various compiler and interpreters
# javascript, C/C++, java, python for level8
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs build-essential default-jre default-jdk python

# Install mplayer and libcaca for level12
#RUN apt-get install -y mplayer
#RUN apt-get install -y caca-utils figlet

# Install netcat for level18
#RUN apt-get install -y netcat
#RUN apt-get install -y net-tools
#RUN chmod +s /bin/netstat

# Install postgresql for level19
#RUN apt-get install -y postgresql-9.4 postgresql-client-9.4

# Install pdftotext for level20
#RUN apt-get install -y poppler-utils

# Install git for level22
#RUN apt-get install -y git

# Install john for level23
# RUN apt-get update && apt-get install -y john

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Get locales
RUN apt-get install locales-all

# Install telnet server
RUN apt-get install -y xinetd telnetd
COPY /etc/inetd.conf /etc/inetd.conf

RUN apt-get install -y less locales
COPY /etc/locale /etc/default/locale

# Level 9
RUN apt-get install -y python3

EXPOSE 22

COPY /scripts/levels /usr/local/levels

# Initialize all levels
COPY /etc/passwd /root/passwd
#COPY /etc/shadow /root/shadow
COPY /etc/group /root/group

RUN /usr/local/levels/init.sh

# bashrc skeletton
#COPY /etc/bashrc /etc/skel/.bashrc
COPY /etc/bash.bashrc /etc/bash.bashrc

COPY /home /var/home

COPY /scripts/start.sh /usr/local/start.sh
COPY /scripts/setup.sh /usr/local/setup.sh
RUN rm -rf /usr/local/levels


CMD ["/usr/local/start.sh"]
