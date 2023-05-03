# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

resource "aws_lb" "alb" {
  name               = "timing"
  internal           = var.internet
  load_balancer_type =  var.lb_type  #"application"
  security_groups    = #[aws_security_group.lb_sg.id]
  subnets            = #[for subnet in aws_subnet.public : subnet.id]
  idle_timeout = var.timeout
  enable_deletion_protection = true

 

  tags = {
    Environment = "production"
  }
}