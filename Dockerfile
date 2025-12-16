# 1. Use a small, stable base
FROM nginx:1.25-alpine

# 2. Remove default nginx site
RUN rm -rf /usr/share/nginx/html/*

# 3. Copy static website files
COPY . /usr/share/nginx/html

# 4. Cloud Run compatibility
#    (uses $PORT env var)
RUN sed -i 's/listen 80;/listen ${PORT};/' /etc/nginx/conf.d/default.conf

# 5. Expose HTTP port
EXPOSE 80

# 6. Start nginx
CMD ["nginx", "-g", "daemon off;"]
