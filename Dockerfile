# Use an official Debian image as a parent image
FROM node:12.14.0-buster

ENV PORT 3000

# Set environment variables to make Python and Node setup easier
ENV PYTHONUNBUFFERED=1 \
    NODE_VERSION=12.14.0

# Install dependencies and utilities needed for Python, pip, and Node.js
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    make \
    ca-certificates \
    gnupg \
    g++ \
    nginx \
    python3 \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    python3-sphinx \
    python3-sphinx-autobuild \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app