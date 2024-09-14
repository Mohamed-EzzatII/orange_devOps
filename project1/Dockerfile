# Stage 1: Build the Go binary
FROM golang:1.18-alpine AS builder
WORKDIR /app

# Copy the Go module files and download dependencies
COPY backend/go.mod backend/go.sum ./
RUN go mod download

# Copy the entire source code and build the binary
COPY backend/main.go ./
RUN go build -o /go-backend

# Stage 2: Create a lightweight image with just the binary
FROM alpine:latest
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /go-backend .

# Expose port 8000 and run the binary
EXPOSE 8000
CMD ["./go-backend"]
