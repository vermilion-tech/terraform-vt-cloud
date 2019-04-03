variable "ssh_keys" {
  type = "list"
}

variable "name" {
  default = "vt-cloud-node"
}

variable "region" {
  default = "nyc1"
}

variable "domain" {
  default = "vermilion.tech"
}

variable "size" {
  default = "s-1vcpu-1gb"
}

variable "tags" {
  type    = "list"
  default = ["terraform", "vt-cloud-node"]
}

variable "image" {
  default = "45478405" # vermilion-ubuntu-18.04-base     2019-04-03T15:38:50Z
}
