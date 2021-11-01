terraform {
  required_providers {
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "= 6.0.0-alpha.3"
    }
  }
}


provider "ionoscloud" {
  username = "${var.ionoscloud_username}"
  password = "${var.ionoscloud_password}"
}


resource "ionoscloud_k8s_cluster" "chris_terraform_k8scluster" {
  name        = "chris_terraform_k8scluster"
  k8s_version = "1.21.4"
  maintenance_window {
    day_of_the_week = "Sunday"
    time            = "03:30:00Z"
  }
}