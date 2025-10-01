output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "master_public_ip" {
  description = "Public IP of the master node"
  value       = aws_instance.master.public_ip
}

output "master_private_ip" {
  description = "Private IP of the master node"
  value       = aws_instance.master.private_ip
}

output "worker_public_ips" {
  description = "Public IPs of worker nodes"
  value       = aws_instance.worker[*].public_ip
}

output "worker_private_ips" {
  description = "Private IPs of worker nodes"
  value       = aws_instance.worker[*].private_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.container_node.id
}

output "master_instance_id" {
  description = "Instance ID of master node"
  value       = aws_instance.master.id
}

output "worker_instance_ids" {
  description = "Instance IDs of worker nodes"
  value       = aws_instance.worker[*].id
}
