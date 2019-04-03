resource "random_id" "this" {
  byte_length = 8
  prefix      = "${var.name}-"
}

module "droplet" {
  source = "github.com/vermilion-tech/terraform-digitalocean?ref=development//modules/droplet"

  size     = "${var.size}"
  name     = "${random_id.this.hex}"
  region   = "${var.region}"
  ssh_keys = "${var.ssh_keys}"
}

module "floating_ip" {
  source = "github.com/vermilion-tech/terraform-digitalocean?ref=development//modules/floating_ip"

  droplet_id = "${module.droplet.droplet_id}"
  region     = "${var.region}"
}

module "dns" {
  source = "github.com/vermilion-tech/terraform-digitalocean?ref=development//modules/dns"

  domain = "${var.domain}"
  name   = "${var.name}"
  value  = "${module.floating_ip.ipv4_address}"
}
