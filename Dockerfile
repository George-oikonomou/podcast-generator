FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3-venv \
  git

# Create a virtual environment and install PyYAML
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install PyYAML

# Add the virtual environment to PATH
ENV PATH="/opt/venv/bin:$PATH"

# Copy the Python script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
