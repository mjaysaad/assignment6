# Base image
FROM fedora:latest

# Upgrade the system
RUN dnf upgrade -y

# Install applications
RUN dnf install -y tuxpaint vim httpd

# Add a sample HTML file to the container
COPY myinfo.html /var/www/html/

# Expose port 80
EXPOSE 80/TCP

# Enable the httpd service
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]

# Build the Docker image
docker build -t assignment6 .

# Run the Docker container 
docker run -p 80:80 assignment6
