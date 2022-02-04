variable "ionoscloud_username" {
  type = string
  description = "IONOS username"
}

variable "ionoscloud_password" {
  type = string
  description = "IONOS password"
}

variable "ionoscloud_datacenter_location" {
  type = string
  description = "IONOS regional location for VDC: gb/lhr, us/las, us/ewr, de/fra, de/fkb"
}