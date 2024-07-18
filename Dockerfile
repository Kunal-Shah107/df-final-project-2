FROM centos:7
LABEL maintainer="acloudguydotin@gmail.com"
RUN yum update -y && \
    yum install -y httpd zip unzip
RUN sudo zip --version
RUN sudo unzip --version
ADD handtime.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip handtime.zip
RUN cp -rvf handtime/* .
RUN rm -rf handtime handtime.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 443

