output "instance_ip" {
  value = linode_instance.mbaza-project.ip_address
}

output "instance_internal_ip" {
  value = linode_instance.mbaza-project.private_ip_address
}

output "node" {
  value = linode_instance.mbaza-project.id  
}