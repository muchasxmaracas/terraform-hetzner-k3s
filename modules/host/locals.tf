locals {
  # ssh_agent_identity is not set if the private key is passed directly, but if ssh agent is used, the public key tells ssh agent which private key to use.
  # For terraforms provisioner.connection.agent_identity, we need the public key as a string.
  ssh_agent_identity = var.ssh_private_key == null ? var.ssh_public_key : null
  # shared flags for ssh to ignore host keys for all connections during provisioning.
  ssh_args = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -o PubkeyAuthentication=yes"

  # ssh_client_identity is used for ssh "-i" flag, its the private key if that is set, or a public key
  # if an ssh agent is used.
  ssh_client_identity = var.ssh_private_key == null ? var.ssh_public_key : var.ssh_private_key

  # the hosts name with its unique suffix attached
  name = "${var.name}-${random_string.server.id}"

  # check if the user has set dns servers
  has_dns_servers = length(var.dns_servers) > 0

      # Create a list of numbers from 0 to N-1 for the control planes.
  # This list is known at plan time.
  control_plane_keys = range(var.control_plane_count)

  # Create a list of numbers from 0 to N-1 for the agents.
  # This list is known at plan time.
  agent_keys = range(var.agent_count)

  # Create a map for the control plane IPs using the static keys.
  # The keys are known at plan time, while the values (IPs) are not.
  control_planes_map = {
    for i in local.control_plane_keys :
    "cp-${i + 1}" => module.kube-hetzner.control_planes_public_ipv4[i]
  }

  # Create a map for the agent IPs using the static keys.
  agents_ipv4_map = {
    for i in local.agent_keys :
    "worker-${i + 1}" => module.kube-hetzner.agents_public_ipv4[i]
  }

  agents_ipv6_map = {
    for i in local.agent_keys :
    "worker-${i + 1}" => module.kube-hetzner.agents_public_ipv6[i]
  }

}
