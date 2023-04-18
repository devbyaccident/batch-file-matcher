ACCOUNT_ID=$(aws sts get-caller-identity --output text | awk '{print $1}')
REGION=$(aws configure get region)

# Build and push container
docker build -t md5-matcher .

docker tag md5-matcher:latest "${ACCOUNT_ID}"dkr.ecr."${REGION}".amazonaws.com/md5-matcher:latest
aws ecr get-login-password --region "${REGION}" | docker login --username AWS --password-stdin "${ACCOUNT_ID}"dkr.ecr."${REGION}".amazonaws.com
docker push "${ACCOUNT_ID}"dkr.ecr."${REGION}".amazonaws.com/md5-matcher:latest
