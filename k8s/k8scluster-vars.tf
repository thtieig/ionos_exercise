variable "ionoscloud_username" {
  type = string
  description = "IONOS username"
}

variable "ionoscloud_password" {
  type = string
  description = "IONOS password"
}

variable "dcid" {
  type = string
  description = "Datacenter UUID from IONOS Control Panel"
}

variable "ionoscloud_datacenter_location" {
  type = string
  description = "IONOS The regional location for this IP Block: us/las, us/ewr, de/fra, de/fkb"
}