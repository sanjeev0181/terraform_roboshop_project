module "vpc" {
  source = "../../terraform-modules/vpc"
  #cidr = "10.1.0.0/16"
  tags = var.tags
}