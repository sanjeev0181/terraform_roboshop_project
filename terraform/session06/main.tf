module "vpc" {
  source = "../../terraform-modules/vpc"
  #cidr = "10.1.0.0/16"
  tags = var.tags
  igw_tags = var.igw_tags
}