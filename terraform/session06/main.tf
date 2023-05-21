module "vpc" {
  source = "../../terraform-modules/vpc"
  instance_type = "10.1.0.0/16"
}