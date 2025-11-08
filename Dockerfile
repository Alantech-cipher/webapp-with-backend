# Use an official Python runtime as the base image
FROM python:3.9-slim

# set working directory 
WORKDIR /app

# Install system-level dependencies
RUN apt-get update \
     && apt-get upgrade -y \
     && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
     && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run your app
CMD [ "Python", "app.py" ]