resource "linode_firewall" "mbaza-product-firewall" {
  label = "mbaza-product-firewall-${var.environment_name}"
  tags  = ["mbaza-product, dev, mbaza"]
  
  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["ff00::/8"]
  }

  inbound {
    label    = "allow-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["ff00::/8"]
  }

  inbound {
    label    = "allow-elastic-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
  }

  inbound_policy = "DROP"
  
  outbound_policy = "ACCEPT"
  
  linodes = [linode_instance.mbaza-project.id]
}
