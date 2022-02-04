# IONOS K8S Demo #

- Create a IONOS Cloud account  
- Create a Kubernetes Cluster with 2 nodes  
- Publish an nginx image with 3 replicas  
- Serve a personalised static index page  
- Produce a repeatable terraform template  

## Steps

1. Create an IONOS account - manual operation. I have opened a new account on the IONOS UK website [here](https://cloud.ionos.co.uk/compute/signup)
2. Create custom Docker Nginx container, using `buildimage.sh` in `docker` folder, and following the instructions
3. Configure `k8scluster.auto.tfvars` (in k8s directory `mv k8scluster.auto.tfvars.example k8scluster.auto.tfvars`) - [Here](https://api.ionos.com/docs/cloud/v6/#locationsget-8llkg) you can find the API call to get the list of all datacenter available in your account.
4. Go into `k8s` directory and run `terraform init`, `terraform plan` and `terraform apply`
5. Once the infrastructure is completed, download the json file from the panel as described [here](https://docs.ionos.com/dcd/managed-kubernetes/download-kubeconfig-file), then use `kubectl --kubeconfig kubeconfig.json <command>` to access your k8s cluster
6. To deploy your custom nginx container run: `kubectl --kubeconfig kubeconfig.json apply -f deploy_web.yaml`
7. To get the URL: `kubectl --kubeconfig kubeconfig.json get svc | grep LoadBalancer | awk '{print "http://"$4}'`
8. Paste the output in your browser and... enjoy! :sparkles:  


## NOTES

### Prerequisites

#### Software
- terraform 
- kubectl
- docker

> _The current exercise has been completed on Ubuntu 20.04.3 LTS using:_  
> - _Terraform v1.1.15 with registry.terraform.io/ionos-cloud/ionoscloud v6.1.3_ 
> - _Kubectl v1.22.5_  
> - _Docker version 20.10.10, build b485636_  



#### Web references
[https://api.ionos.com/docs/cloud/v6/#locationsget-8llkg](https://api.ionos.com/docs/cloud/v6/#locationsget-8llkg)
[https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs)  
[https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/k8s_node_pool](https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/k8s_node_pool)  
[https://learn.hashicorp.com/tutorials/terraform/dependencies](https://learn.hashicorp.com/tutorials/terraform/dependencies)  
[https://github.com/ionos-cloud/terraform-provider-ionoscloud](https://github.com/ionos-cloud/terraform-provider-ionoscloud)  
[https://docs.ionos.com/dcd/managed-kubernetes/download-kubeconfig-file](https://docs.ionos.com/dcd/managed-kubernetes/download-kubeconfig-file)  


