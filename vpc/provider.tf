terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.65.0"
    }
  }
   #s3 Configuration
  #https://developer.hashicorp.com/terraform/language/settings/backends/s3
  backend "s3" {
    bucket = "timing-remote"
    key    = "automated-vpc"
    region = "us-east-1"
    dynamodb_table = "timing-remote-dynamodb"
  }
}

# provider "aws" {
#   # Configuration options
# }