# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Install Apache and other required packages
RUN apt-get update && apt-get install -y apache2

# Copy your index.html file to the default Apache web root directory
COPY index.html /var/www/html/index.html

# Start Apache in the foreground when the container starts
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

