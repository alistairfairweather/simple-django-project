FROM python:latest

WORKDIR /app

# Update packages and install dependencies for cffi and lxml
RUN apt-get update -qq && \
    apt-get install -y git python3-pip build-essential libffi-dev libxml2-dev libxslt-dev

# Copy the local code to the container's workspace
COPY . /app

# Install Python dependencies
RUN python3 -m pip install -r requirements.txt

# You can also include cffi and lxml explicitly if they're not in your requirements.txt
RUN python3 -m pip install cffi lxml
