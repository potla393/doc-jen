# Stage 1: Build the index.html file
FROM ubuntu as builder

# Copy your index.html file to the container
COPY index.html /app/index.html

# Stage 2: Create the final image with Apache2
FROM ubuntu

# Install Apache2 and other required packages
RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the index.html file from the builder stage to the Apache2 web root directory
COPY --from=builder /app/index.html /var/www/html/index.html

# Start Apache2 in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
