FROM ubuntu:20.04

# Set the maintainer label
LABEL maintainer="acloudguydotin@gmail.com"

# Set environment variable to suppress interactive prompts and set the timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Update the system and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add the zip file to the container
ADD handtime.zip /var/www/html/

# Change working directory
WORKDIR /var/www/html/

# Unzip the file
RUN unzip handtime.zip && \
    cp -rvf handtime-html/* . && \
    rm -rf handtime-html handtime.zip

# Set the command to run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose ports 80 and 443
EXPOSE 80 443

