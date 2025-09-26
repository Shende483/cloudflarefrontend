# Use the official Node.js 20 slim image as the base
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port defined in .env (VITE_PORT=3014)
EXPOSE 3014

# Command to serve the built application using VITE_PORT
CMD ["sh", "-c", "npm run preview -- --port ${VITE_PORT:-3014}"]