#server set up #
locals {
  instance_group = "${var.instance_group}_${var.environment_name}"
  gihub_runner_tags = "linodes,${var.environment_name},product,ussd"
}
resource "linode_instance" "mbaza-project" {
    image = var.packer_image
    type = var.linodes_type
    group = local.instance_group
    label = "${local.instance_group}_${var.instance_label}"
    region = var.region
    authorized_keys = var.authorized_keys
    root_pass = var.root_password
    tags = var.tags
    swap_size = 1024
    private_ip = true
    connection {
    type        = "ssh"
    user        = var.root_username
    password    = var.root_password
    agent       = false
    host        = self.ip_address
  }
  
}

resource "null_resource" "change_mbaza-project_hostname"{
  
  connection {
    type        = "ssh"
    user        = var.root_username
    password    = var.root_password
    agent       = false
    host        = linode_instance.mbaza-project.ip_address
  }

  provisioner "remote-exec" {
    inline = ["hostnamectl set-hostname mbaza-${var.environment_name}"]
  }
}

