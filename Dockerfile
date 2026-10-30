# Stage 1: Build and Test Environment
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Run the quality gates inside the container build process
RUN npm run lint
RUN npm test

# Stage 2: Production Runtime
FROM node:20-alpine AS production
WORKDIR /app
COPY package*.json ./
# Install only production dependencies
RUN npm ci --omit=dev
# Copy only the application code from the builder stage
COPY --from=builder /app/server.js ./

EXPOSE 3000
# Run as non-root user for security
USER node
CMD ["node", "server.js"]