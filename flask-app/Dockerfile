# Use official Python image from DockerHub
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Expose the port
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]
