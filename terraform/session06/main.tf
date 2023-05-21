module "vpc" {
  source = "../../terraform-modules/vpc"
  #cidr = "10.1.0.0/16"
  tags = var.tags
  igw_tags = var.igw_tags
  public_subnets_tags = var.public_subnets_tags
  private_subnets_tags = var.private_subnets_tags
  public_rt_tags = var.public_rt_tags
  nat_tags = var.nat_tags
  private_rt_tags = var.private_rt_tags
  db_subnets_tags = var.db_subnets_tags
}