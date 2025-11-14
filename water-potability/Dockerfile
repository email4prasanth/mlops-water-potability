# # Stage 1: Builder (install dependencies)
# FROM python:3.9-slim as builder
# WORKDIR /app
# # Install system deps (for numpy, pandas, etc.)
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends gcc python3-dev && \
#     rm -rf /var/lib/apt/lists/*
# # Install Python deps to /app/.local (not /root)
# COPY requirements.txt .
# RUN pip install --user --no-cache-dir -r requirements.txt


# # Stage 2: Runtime (lean image)
# FROM python:3.9-slim
# WORKDIR /app
# # Copy Python libs from builder (now from /app/.local)
# COPY --from=builder /app/.local /app/.local
# ENV PATH=/app/.local/bin:$PATH
# # Copy app code (ensure .dockerignore excludes unnecessary files)
# COPY . .
# # Set non-root user and fix permissions
# RUN useradd -m appuser && \
#     chown -R appuser:appuser /app && \
#     chmod -R 755 /app
# USER appuser
# EXPOSE 8000
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# Stage 1: Builder (install dependencies)
FROM python:3.9-slim as builder
WORKDIR /app

# Install system deps
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime
FROM python:3.9-slim
WORKDIR /app

# Copy virtual environment
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy app code
COPY . .

# Set up non-root user
RUN useradd -m appuser && \
    chown -R appuser:appuser /app
USER appuser

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
