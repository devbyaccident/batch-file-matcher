import hashlib
import boto3

def get_s3_file_md5(bucket_name, s3_key):
    """
    Returns the MD5 hash of the file stored in the specified S3 bucket and key.
    """
    s3 = boto3.client('s3')
    md5 = hashlib.md5()
    chunk_size = 1024 * 1024  # 1 MB
    start_byte = 0
    
    # Get the size of the file so we know when to stop reading
    response = s3.head_object(Bucket=bucket_name, Key=s3_key)
    file_size = response['ContentLength']

    while True:
        # Read the file in chunks to reduce memory usage
        end_byte = min(start_byte + chunk_size, file_size) - 1
        response = s3.get_object(
            Bucket=bucket_name, 
            Key=s3_key, 
            Range=f'bytes={start_byte}-{end_byte}'
        )
        data = response['Body'].read()
        if not data:
            break
        md5.update(data)
        start_byte += chunk_size
    
    return md5.hexdigest()
