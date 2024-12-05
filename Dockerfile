# Use a compatible Python runtime
FROM python:3.10-slim

# Set the working directory
WORKDIR /test

# Copy project files
COPY . /test

# Install system dependencies (if required)
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Streamlit port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "test.py", "--server.port=8501", "--server.address=0.0.0.0"]
