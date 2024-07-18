FROM centos:7
MAINTAINER acloudguydotin@gmail.com
RUN yum install -y httpd \
 zip \
 unzip
ADD /var/lib/jenkins/workspace/devops-pipeline/handtime.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip handtime.zip
RUN cp -rvf handtime/* .
RUN rm -rf handtime handtime.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 443

