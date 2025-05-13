# Stage 1: Build dependencies
FROM python:3.9-slim as builder

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Install Python packages globally
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Stage 2: Final image
FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a non-root user
RUN useradd -m appuser

WORKDIR /app

# Copy installed packages and source code
COPY --from=builder /usr/local /usr/local
COPY . .

# Expose app port
EXPOSE 5000

# Healthcheck endpoint
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:5000/health || exit 1

# Switch to non-root user
#USER appuser

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

