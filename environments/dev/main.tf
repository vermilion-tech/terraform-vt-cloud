variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

data "digitalocean_ssh_key" "kaden" {
  name = "kaden@vermilion.tech"
}

data "digitalocean_ssh_key" "ari" {
  name = "ari@vermilion.tech"
}

module "vt_cloud_node_2" {
  source = "../../modules/node"

  name   = "vt-cloud-node-2"
  region = "nyc1"
  domain = "vermilion.tech"

  tags = "${var.tags}"

  ssh_keys = [
    "${data.digitalocean_ssh_key.kaden.fingerprint}",
    "${data.digitalocean_ssh_key.ari.fingerprint}",
  ]
}
