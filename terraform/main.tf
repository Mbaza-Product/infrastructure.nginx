module "mbaza_product" {
    source = "./modules/infrastructure"
    root_password = var.root_password
    authorized_keys = var.authorized_keys
    packer_image = "private/13848656"
    token = var.token
    tags = var.tags
    linodes_type = "g6-standard-4"
    environment_name = var.environment_name
}