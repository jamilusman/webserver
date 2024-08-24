# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Remove the default Nginx configuration
RUN rm /usr/share/nginx/html/*

# Copy the index.html file into the Nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for the Nginx server
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
