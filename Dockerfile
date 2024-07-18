FROM ubuntu:20.04

# Set the maintainer label
LABEL maintainer="acloudguydotin@gmail.com"

# Update the system and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean

# Verify the installation of zip and unzip
RUN zip --version
RUN unzip --version

# Add the zip file to the container
ADD handtime.zip /var/www/html/

# Change working directory
WORKDIR /var/www/html/

# Unzip the file
RUN unzip handtime.zip && \
    cp -rvf handtime/* . && \
    rm -rf handtime handtime.zip

# Set the command to run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose ports 80 and 443
EXPOSE 80 443

