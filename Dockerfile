# Stage 1: Build the Angular application
FROM node:16 as build


# Set the working directory
WORKDIR /app


# Copy the package.json and package-lock.json (if available)
COPY package*.json /app/


# Install dependencies
RUN npm install


# Copy the project files to the Docker image
COPY . /app


# Build the project
RUN npm run build


# Stage 2: Serve the application with Nginx
FROM nginx:alpine


# Copy the build output from the first stage
COPY --from=build /app/dist/my-angular-project /usr/share/nginx/html


# Expose port 80
EXPOSE 80


# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
