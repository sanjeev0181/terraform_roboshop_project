terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
  #s3 Configuration
  #https://developer.hashicorp.com/terraform/language/settings/backends/s3
  backend "s3" {
    bucket = "timing-remote"
    key    = "timing01"
    region = "us-east-1"
    dynamodb_table = "timing-remote-dynamodb"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

