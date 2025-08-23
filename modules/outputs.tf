output "control_planes_public_ipv6" {
  value       = hcloud_server.control_plane[*].ipv6_address
  description = "List of public IPv6 addresses of the control plane nodes."
}

output "agents_public_ipv6" {
  value       = hcloud_server.agent[*].ipv6_address
  description = "List of public IPv6 addresses of the agent nodes."
}
