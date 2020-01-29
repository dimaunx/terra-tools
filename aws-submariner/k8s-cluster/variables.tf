variable "aws_region" {
  description = "aws region name"
}

variable "ssh_public_key_path" {
  description = "ssh public key for aws key creation"
}

variable "ssh_private_key_path" {
  description = "ssh private path key for ssh connection to the instances"
}

variable "env_vpc_index" {
  description = "VPC CIDR."
}

variable "base_name" {
  description = "Base name for all resources"
}

variable "cluster_name" {
  description = "K8S cluster name"
}

variable "number_workers_nodes" {
  description = "The number of worker nodes."
}

variable "master_instance_type" {
  description = "Master node instance type."
}

variable "worker_instance_type" {
  description = "Worker node instance type."
}

variable "service_cidr" {
  description = "Kubernetes services cidr."
}

variable "pod_cidr" {
  description = "Kubernetes pods cidr."
}

variable "aws_ssh_user" {
  description = "User ssh access."
  default     = "centos"
}

variable "kube_version" {
  description = "Kubernetes version."
  default     = "v1.17.0"
}

variable "master_bind_port" {
  description = "API service external port"
  default     = 6443
}

variable "allowed_ips" {
  type        = "list"
  description = "List of ips that are allowed all traffic."
}