# Use a Python 3 base image
FROM python:3

# Install the required Python packages
RUN pip install boto3

# Copy the Python script that contains the function to the container
COPY src/md5_hash.py /usr/local/bin

# Set the working directory
WORKDIR /usr/local/bin

# Make the script executable
RUN chmod +x md5_hash.py

# Set the entrypoint to the Python script
ENTRYPOINT ["python", "md5_hash.py"]
