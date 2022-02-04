terraform {
  required_providers {
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "= 6.1.3"
    }
  }
}

# Authentication
provider "ionoscloud" {
  username = "${var.ionoscloud_username}"
  password = "${var.ionoscloud_password}"
}

# Datacenter creation
resource "ionoscloud_datacenter" "demo-dc" {
  name        = "Demo Datacentre"
  location    = "${var.ionoscloud_datacenter_location}"
  description = "VDC managed by Terraform"
}

# K8S Cluster definition
resource "ionoscloud_k8s_cluster" "k8scluster_ControlPlane" {
  name        = "k8scluster_ControlPlane"
  k8s_version = "1.21.4"
  maintenance_window {
    day_of_the_week = "Sunday"
    time            = "03:30:00Z"
  }
}

# K8S Pool setup
resource "ionoscloud_k8s_node_pool" "k8scluster_NodePool" {
  name        = "k8scluster_NodePool"
  k8s_version = "1.21.4"
  maintenance_window {
    day_of_the_week = "Sunday"
    time            = "04:30:00Z"
  }
  datacenter_id     = ionoscloud_datacenter.demo-dc.id
  k8s_cluster_id    = ionoscloud_k8s_cluster.k8scluster_ControlPlane.id
  cpu_family        = "INTEL_SKYLAKE"
  availability_zone = "AUTO"
  storage_type      = "HDD"
  node_count        = 2
  cores_count       = 1
  ram_size          = 2048
  storage_size      = 10
}