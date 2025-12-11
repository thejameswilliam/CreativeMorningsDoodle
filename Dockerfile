# Use official Node.js LTS image
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy application files
# Install su-exec for step-down from root
RUN apk add --no-cache su-exec

# Copy application files
COPY server.js ./
COPY public ./public/
COPY docker-entrypoint.sh /usr/local/bin/

# Make entrypoint executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Create drawings directory with proper permissions
RUN mkdir -p drawings && chown -R node:node /app

# Expose the app port
EXPOSE 8080

# Use entrypoint script to fix permissions and switch user
ENTRYPOINT ["docker-entrypoint.sh"]

# Start the application
CMD ["node", "server.js"]
