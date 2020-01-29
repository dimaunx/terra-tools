//terraform {
//  backend "s3" {
//    bucket = "dev-submariner-tfstate"
//    key    = "k8-cluster-submariner/terraform.tfstate"
//    region = "us-east-1"
//  }
//}

locals {
  allowed_ips            = ["0.0.0.0/32"]
  user_id                = "someuser"
  local_private_key_path = "~/.ssh/id_rsa"
  local_public_key_path  = "~/.ssh/id_rsa.pub"
}

module "aws-cluster1" {
  source               = "./k8s-cluster"
  aws_region           = "us-east-1"
  ssh_public_key_path  = local.local_public_key_path
  ssh_private_key_path = local.local_private_key_path
  base_name            = "${local.user_id}-cl1"
  cluster_name         = "cl1"
  env_vpc_index        = "10.164"
  master_instance_type = "t2.medium"
  worker_instance_type = "t2.medium"
  number_workers_nodes = 2
  service_cidr         = "100.94.0.0/16"
  pod_cidr             = "10.244.0.0/14"
  kube_version         = "1.16.6"
  allowed_ips          = local.allowed_ips
}

module "aws-cluster2" {
  source               = "./k8s-cluster"
  aws_region           = "us-west-1"
  ssh_public_key_path  = local.local_public_key_path
  ssh_private_key_path = local.local_private_key_path
  base_name            = "${local.user_id}-cl2"
  cluster_name         = "cl2"
  env_vpc_index        = "10.165"
  master_instance_type = "t2.medium"
  worker_instance_type = "t2.medium"
  number_workers_nodes = 2
  service_cidr         = "100.95.0.0/16"
  pod_cidr             = "10.248.0.0/14"
  kube_version         = "1.16.6"
  allowed_ips          = local.allowed_ips
}

module "aws-cluster3" {
  source               = "./k8s-cluster"
  aws_region           = "us-west-2"
  ssh_public_key_path  = local.local_public_key_path
  ssh_private_key_path = local.local_private_key_path
  base_name            = "${local.user_id}-cl3"
  cluster_name         = "cl3"
  env_vpc_index        = "10.166"
  master_instance_type = "t2.medium"
  worker_instance_type = "t2.medium"
  number_workers_nodes = 2
  service_cidr         = "100.96.0.0/16"
  pod_cidr             = "10.252.0.0/14"
  kube_version         = "1.16.6"
  allowed_ips          = local.allowed_ips
}

//module "submariner_gateway_cluster2" {
//  source              = "./submariner"
//  aws_key_name        = local.aws_key_name
//  local_key_name      = local.local_key_name
//  cluster_name        = "cl2"
//  service_cidr        = "100.95.0.0/16"
//  pod_cidr            = "10.248.0.0/14"
//  broker_node         = module.aws-cluster1.master_public_dns
//  gateway_node        = module.aws-cluster2.gateway_node_private_dns
//  gateway_master_node = module.aws-cluster2.master_public_dns
//  env_vpc_id          = module.aws-cluster2.env_vpc_id
//}
//
//module "submariner_gateway_cluster3" {
//  source              = "./submariner"
//  aws_key_name        = local.aws_key_name
//  local_key_name      = local.local_key_name
//  cluster_name        = "cl3"
//  service_cidr        = "100.96.0.0/16"
//  pod_cidr            = "10.252.0.0/14"
//  broker_node         = module.aws-cluster1.master_public_dns
//  gateway_node        = module.aws-cluster3.gateway_node_private_dns
//  gateway_master_node = module.aws-cluster3.master_public_dns
//  env_vpc_id          = module.aws-cluster3.env_vpc_id
//}
