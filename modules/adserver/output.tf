output "instance_public_ip" {
  value = aws_instance.insurity.public_ip
}

output "instance_private_ip" {
  value = aws_instance.insurity.private_ip
}


output "ad_instance_name" {
  value = aws_instance.insurity.tags.Name
}

output "subnet_id" {
  value = aws_instance.insurity.subnet_id
}

output "availability_zone" {
  value = aws_instance.insurity.availability_zone
}
output "instance_id" {
  value = aws_instance.insurity.id
}
