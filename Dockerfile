FROM ubuntu:20.04

# Set the maintainer label
LABEL maintainer="acloudguydotin@gmail.com"

# Set environment variable to suppress interactive prompts and set the timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Update the system and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip

# Add the zip file to the container
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip /var/www/html/

# Change working directory
WORKDIR /var/www/html/

# Unzip the file
RUN unzip antique-cafe && \
    cp -rvf antique-cafe-html/* . && \
    rm -rf antique-cafe-html antique-cafe.zip

# Set the command to run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose ports 80 and 443
EXPOSE 80 443

