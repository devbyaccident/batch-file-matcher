# AWS S3 MD5 Hash

This repository contains a Python script and a Dockerfile for generating the MD5 hash of a file stored in an Amazon S3 bucket.

## ChatGPT

The code and readme (Except for this header obviously) in this repository was generated with ChatGPT at 3 in the morning cause I couldn't sleep and wanted to see what would happen. I did some editing to make it a little cleaner and more organized, but this repo is really just my way of playing around with new tech, and should not be run without a lot more work. You have been warned.

## Python script

The get_s3_file_md5() function in the md5_hash.py script generates the MD5 hash of a file stored in an S3 bucket. The function reads the file in chunks to reduce memory usage and uses the hashlib and boto3 modules to generate the hash and access the S3 bucket, respectively.

To use the function, pass in the name of the S3 bucket and the key (i.e. path) to the file you want to hash:

```python
bucket_name = "my-s3-bucket"
s3_key = "path/to/file.txt"
md5_hash = get_s3_file_md5(bucket_name, s3_key)
print(md5_hash)
```

## Dockerfile

The Dockerfile in this repository sets up an environment for running the md5_hash.py script as the entrypoint. The Dockerfile installs the required Python packages, copies the md5_hash.py script to the container, and sets the entrypoint to the Python script.

To build the Docker image, run the following command from the directory containing the Dockerfile:

```bash
docker build -t md5-matcher .
```

To run the Docker container and generate the MD5 hash of a file stored in an S3 bucket, use the following command:

```bash
docker run md5-matcher <bucket-name> <s3-key>
```

Replace <bucket-name> and <s3-key> with the name of your S3 bucket and the path to the file you want to hash, respectively.

## License

This repository is licensed under the MIT License. Feel free to use, modify, and distribute the code as you see fit.
