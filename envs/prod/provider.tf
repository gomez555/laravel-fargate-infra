provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      Env    = "prod"
      System = "laravel-fargate"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }

  required_version = ">1.0.0"
}