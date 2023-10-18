variable "aws_region" {
  description = "Region Name"
  type        = string
  default     = "us-east-1"
}

variable "business_division" {
  description = "Team"
  type        = string
  default     = "fast-food"
}

variable "environment" {
  description = "Infrastructure Environment"
  type        = string
  default     = "dev"
}

# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "fast-food-cluster"  
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type        = string
  default     = 1.28
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# variable "cluster_public_nodegroups" {
#     description = "value"
#     type = list(object)
# }

# variable "cluster_private_nodegroups" {
#     description = "value"
#     type = list(object)
# }

variable "eks_control_role" {
  description = "IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf"
  type        = string
  default     = "fast-food-dev-eks-cluster-role"
}

variable "nodegroup_role" {
  description = "Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group"
  type        = string
  default     = "fast-food-dev-eks-nodegroup-role"
}

variable "vpc_name" {
  description = "Cluster VPC Name"
  type        = string
  default     = "fast-food-dev-myvpc-VPC"
}

variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["Public-Subnet-us-east-1b", "Public-Subnet-us-east-1a"]
}

variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["Private-Subnet-us-east-1a", "Private-Subnet-us-east-1b"]
}

variable "eks_nodegroup_list" {
  description = "Cluster NodeGroups"
  type = list(object({
    name           = string
    is_private     = bool
    ami_type       = string
    capacity_type  = string
    disk_size      = number
    instance_types = list(string)
    remote_access = object({
      ec2_ssh_key = string
    })
    scaling = object({
      expected = number
      min      = number
      max      = number
    })
    update_config = object({
      max_unavailable = number
    })
  }))
  default = [
    {
      name           = "fast-food-dev-eksdemo1-eks-ng-public"
      is_private     = false
      ami_type       = "AL2_x86_64"
      capacity_type  = "ON_DEMAND"
      disk_size      = 20
      instance_types = ["t3.medium"]
      remote_access = {
        ec2_ssh_key = "demokey1"
      }
      scaling = {
        expected = 1
        min      = 1
        max      = 2
      }
      update_config = {
        max_unavailable = 1
      }
    },
    {
      name           = "fast-food-dev-eksdemo1-eks-ng-private"
      is_private     = true
      ami_type       = "AL2_x86_64"
      capacity_type  = "ON_DEMAND"
      disk_size      = 20
      instance_types = ["t3.medium"]
      remote_access = {
        ec2_ssh_key = "demokey1"
      }
      scaling = {
        expected = 1
        min      = 1
        max      = 2
      }
      update_config = {
        max_unavailable = 1
      }
    }
  ]
}
