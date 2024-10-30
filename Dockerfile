FROM node:20

# Set environment variables
ENV NODE_ENV=development

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Expose the application port
EXPOSE 3333

# Start the application
CMD ["npm", "run", "start"]