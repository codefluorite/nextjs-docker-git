# Use Node.js LTS base image
FROM node:20-alpine3.16

# Set working directory
WORKDIR /app

# Install Git
# Install Git and SSH (optional but useful for GitHub access via SSH)
RUN apk update && \
    apk add --no-cache git openssh

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose Next.js dev port
EXPOSE 3000

# Start Next.js dev server
CMD ["npm", "run", "dev"]
