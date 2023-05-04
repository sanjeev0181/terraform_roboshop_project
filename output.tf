output "ip_address" {
   value = aws_instance.web.public_ip
}

output "ami_id" {
  value = data.aws_ami.example.image_id
}

output "current_region" {
    value = data.aws_region.current
    #value = data.aws_region.current.name
}