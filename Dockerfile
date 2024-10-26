# Build stage
FROM rust:latest AS builder

WORKDIR /usr/src/app

# Copy manifests
COPY . .

# Build release binary
RUN cargo build --release

# Runtime stage  
FROM debian:bookworm-slim

# Install Dependencies
RUN apt-get update && apt-get install -y \
  libc6 \
  && rm -rf /var/lib/apt/lists/*

# Copy binary from build stage
COPY --from=builder /usr/src/app/target/release/tftpd /usr/local/bin/tftpd

# Expose port
EXPOSE 6969

# Run the web service
CMD ["tftpd", "-i", "0.0.0.0", "-p", "6969", "-d", "/opt/ztp", "-r"]