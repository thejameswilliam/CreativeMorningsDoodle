# Use official Node.js LTS image
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy application files
COPY server.js ./
COPY public ./public/

# Create drawings directory with proper permissions
RUN mkdir -p drawings && chown -R node:node /app

# Switch to non-root user for security
USER node

# Expose the app port
EXPOSE 8080

# Start the application
CMD ["node", "server.js"]
