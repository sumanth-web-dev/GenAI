# Use an official Python runtime as a base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /test

# Copy the project files into the container
COPY . /test

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Streamlit's default port
EXPOSE 8501

# Run the Streamlit test
CMD ["streamlit", "run", "test.py", "--server.port=8501", "--server.address=0.0.0.0"]
