# Define the AWS provider
provider "aws" {
  region = data.aws_region.current.id
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
