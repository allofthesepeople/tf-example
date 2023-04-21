terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "4.0.1"
}
