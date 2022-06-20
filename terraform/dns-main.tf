resource "linode_domain" "mbaza_domain" {
    type = "master"
    domain = "mbaza.org"
    soa_email = "samuel@digitalumuganda.com"
    tags = ["community", "mbaza-product"]
}

resource "linode_domain_record" "mbaza-proudct_subdomain" {
    domain_id = linode_domain.mbaza_domain.id
    name = var.environment_name
    record_type = "A"
    target = module.mbaza_product.instance_ip
}

resource "linode_domain_record" "wildcard-mbaza-proudct_subdomain" {
    domain_id = linode_domain.mbaza_domain.id
    name = "*.${var.environment_name}"
    record_type = "A"
    target = module.mbaza_product.instance_ip
}