# Use Node as base
FROM node:18

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build any submodules (if needed)
RUN git submodule update --init --recursive

# Expose the backend port
EXPOSE 3001

# Start the backend server
CMD ["npm", "run", "start"]
