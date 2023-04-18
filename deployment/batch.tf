# Create a job definition
resource "aws_batch_job_definition" "my_job_definition" {
  name = "my-job-definition"
  type = "container"
  container_properties = jsonencode({
    image   = "${data.aws_caller_identity.current.id}.dkr.ecr.${data.aws_region.current.id}.amazonaws.com/md5-matcher:latest"
    command = ["my-s3-bucket", "path/to/file.txt"]
  })
  retry_strategy {
    attempts = 1
  }
}

# Create a job queue
resource "aws_batch_job_queue" "my_job_queue" {
  name                 = "my-job-queue"
  priority             = 1
  compute_environments = [aws_batch_compute_environment.my_compute_environment.arn]
}

# Create a compute environment
resource "aws_batch_compute_environment" "my_compute_environment" {
  name         = "my-compute-environment"
  type         = "EC2"
  service_role = aws_iam_role.my_iam_role.arn
  compute_resources {
    instance_role      = aws_iam_instance_profile.my_instance_profile.arn
    instance_type      = "t3.micro"
    minv_cpus          = 0
    maxv_cpus          = 4
    desiredv_cpus      = 0
    security_group_ids = [aws_security_group.my_security_group.id]
    subnets            = [aws_subnet.my_subnet.id]
  }
}
