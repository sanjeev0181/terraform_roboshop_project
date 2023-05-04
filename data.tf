# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "^myami-\\d{3}"
  #owners           = ["521045274894"]
  owners           = [var.aws_accounts[data.aws_region.current.name]]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# I want to fetch which region i am in.This example will fetch the info regarding your current region.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
data "aws_region" "current" {}