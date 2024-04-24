# Use an official Node.js runtime as a parent image, based on the Linux Alpine version for small footprint
FROM node:16-alpine

# Set the working directory in the container to /WebApp
WORKDIR /usr/src/app/WebApp

# Copy the package.json and package-lock.json (if available)
COPY WebApp/package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Copy the rest of your application's source code
COPY WebApp/ .

# Build your application
RUN npm run build

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable to inform the application on which port it should run
ENV PORT=80

# Start your application
CMD ["npm", "run", "start"]
