output "network_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.main.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = google_compute_subnetwork.main.name
}

output "master_public_ip" {
  description = "Public IP of the master node"
  value       = google_compute_instance.master.network_interface[0].access_config[0].nat_ip
}

output "master_private_ip" {
  description = "Private IP of the master node"
  value       = google_compute_instance.master.network_interface[0].network_ip
}

output "worker_public_ips" {
  description = "Public IPs of worker nodes"
  value       = [for instance in google_compute_instance.worker : instance.network_interface[0].access_config[0].nat_ip]
}

output "worker_private_ips" {
  description = "Private IPs of worker nodes"
  value       = [for instance in google_compute_instance.worker : instance.network_interface[0].network_ip]
}

output "master_instance_name" {
  description = "Name of master instance"
  value       = google_compute_instance.master.name
}

output "worker_instance_names" {
  description = "Names of worker instances"
  value       = google_compute_instance.worker[*].name
}
