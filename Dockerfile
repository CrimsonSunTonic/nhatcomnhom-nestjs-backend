FROM node:20

# Set environment variables
# ENV NODE_ENV=development

# Set the working directory
WORKDIR /app

RUN npm i -g @nestjs/cli

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Generate Prisma client
#RUN npx prisma generate

# Start the application
# CMD ["npm", "run", "build"]
CMD ["npm", "run", "start:dev"]