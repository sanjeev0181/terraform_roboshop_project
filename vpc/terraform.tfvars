cidr = "10.0.0.0/16"
default = {
   Name = "timing"
   Environment = "DEV"
   terraform = "true"
}
public_subnets_cidr = "10.0.1.0/24"
private_subnets_cidr = "10.0.2.0/24"
internet_cidr = "0.0.0.0/0"
internet = true
lb_type = "application"
#subents_ids = [] 
#security_groups =  []
timeout = 60