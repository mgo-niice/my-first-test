FROM lscr.io/linuxserver/openssh-server:latest

ENV PUID=1000
ENV PGID=1000
ENV TZ=Europe/Berlin

ENV SUDO_ACCESS=true
ENV PASSWORD_ACCESS=true
ENV USER_PASSWORD=mogenius
ENV USER_NAME=mogenius

VOLUME /sys/fs/cgroup

RUN apk update
RUN apk add mysql mysql-client util-linux openrc rsyslog rsyslog-openrc
RUN apk add openrc-dev busybox-mdev-openrc mdevd-openrc
RUN apk add net-tools alpine-conf perl-sys-hostname-long s6-linux-utils

# RUN openrc

RUN rc-update add rsyslog default\
  && mkdir /run/openrc\
  && touch /run/openrc/softlevel


# REMOVE CACHE ALPINE
RUN rm -vrf /var/cache/apk/*

# RUN /etc/init.d/mariadb setup

#RUN rc-service rsyslog start
#RUN rc-service mariadb start

#COPY ./entrypoint.sh /usr/local/bin
#RUN chmod u+x /usr/local/bin/entrypoint.sh \
#    ln -s /usr/local/bin/entrypoint.sh / 

#ENTRYPOINT ["entrypoint.sh"]

# COPY config/docker/entrypoint.sh /usr/local/bin/
# RUN chmod u+x,g+x /usr/local/bin/entrypoint.sh \
#  && ln -s /usr/local/bin/entrypoint.sh / # backwards compat
#ADD html/ /var/www/html/
#WORKDIR /var/www/html/
#ENTRYPOINT ["entrypoint.sh"]
#CMD ["httpd", "-DNO_DETACH", "-DFOREGROUND", "-e", "info"]



#RUN mariadbd-safe setup
#RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

#RUN apk add python3
#RUN apk add py3-pip
#RUN pip install flask

EXPOSE 2222
# EXPOSE 33066

# docker build -f ubuntu.Dockerfile -t my-ubuntu .
# docker run -d -p 2222:22 my-ubuntu
# docker run -d -p 5000-5020:5000-5020 -p 2222:22 my-ubuntu

