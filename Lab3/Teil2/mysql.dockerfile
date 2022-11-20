FROM debian:jessie
USER root

ENV DEBIAN_FRONTEND noninteractive
ENV container docker

RUN apt update
RUN apt upgrade
RUN apt install -y wget
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.9-1_all.deb
RUN apt install -y lsb-release
RUN dpkg -i mysql-apt-config_0.8.9-1_all.deb
RUN apt update
RUN apt install -y --force-yes mysql-server
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

RUN service mysql restart \
    && echo "UPDATE mysql.user SET authentication_string = PASSWORD('mysql_root') WHERE User = 'root';" | mysql -uroot \
    && echo "DROP USER IF EXISTS ''@'localhost';" | mysql -uroot \
    && echo "DROP USER IF EXISTS ''@'$(hostname)';" | mysql -uroot \
    && echo "DROP DATABASE IF EXISTS test;" | mysql -uroot \
    && echo "FLUSH PRIVILEGES;" | mysql -uroot \
    && service mysql stop

VOLUME ["/var/lib/mysql/", "/etc/mysql"]

EXPOSE 3306/tcp

ENV MYSQL_DB 'wordpressDatabase'
ENV MYSQL_USER 'user'
ENV MYSQL_PASS 'mypassword'