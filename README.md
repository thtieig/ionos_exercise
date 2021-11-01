# IONOS Exercise #

I have been asked to do the following:
- Create an account
- create a Kubernetes Cluster with 2 nodes
- publish an nginx image with 3 replicas
- optional to serve a personalised static index page
- bonus if you can produce a repeatable terraform template


## NOTES

### Prerequisites
- terraform
- kubectl
- docker

### Steps
1) Create an IONOS account - manual operation
2) Create custom Docker Nginx container (docker folder)
3) Configure `k8scluster.auto.tfvars` in k8s directory
4) Within k8s run `terraform init`, `terraform plan` and `terraform apply`
5) Once the infrastructure is completed, download the json file from the panel as described [here] (https://docs.ionos.com/dcd/managed-kubernetes/download-kubeconfig-file), then use `kubectl --kubeconfig kubeconfig.json <command>`
6) Within k8s run `kubectl --kubeconfig kubeconfig.json apply -f deploy_web.yaml`

#### Web references
[https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs)
[https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/k8s_node_pool](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/k8s_node_pool)
[https://github.com/ionos-cloud/terraform-provider-ionoscloud](https://github.com/ionos-cloud/terraform-provider-ionoscloud)
[https://docs.ionos.com/dcd/managed-kubernetes/download-kubeconfig-file](https://docs.ionos.com/dcd/managed-kubernetes/download-kubeconfig-file)

