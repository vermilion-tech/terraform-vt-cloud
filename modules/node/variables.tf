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
  default = "512mb"
}
