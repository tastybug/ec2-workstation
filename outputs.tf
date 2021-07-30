output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance."
  value       = aws_instance.ec2_instance.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance."
  value       = aws_instance.ec2_instance.public_dns
}