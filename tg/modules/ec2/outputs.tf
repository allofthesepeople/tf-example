output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.this[*].id
}

output "public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.this[*].public_ip
}

output "public_dns" {
  description = "Public DNS names of the EC2 instances"
  value       = aws_instance.this[*].public_dns
}
