FROM node:18

# Set working directory
WORKDIR /app

# 1. Copy package files first for better caching
COPY package*.json ./

# 2. Install dependencies
RUN npm install

# 3. Copy all files (except those in .dockerignore)
COPY . .

# 4. Build Storybook (optional - only needed for static export)
RUN npm run build-storybook

# 5. Expose ports
EXPOSE 3000  
EXPOSE 6006 

# 6. Single CMD using concurrent execution
CMD ["npm", "run", "dev:all"]