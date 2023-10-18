aws_region = "us-east-1"

eks_nodegroup_list = [
  {
    name           = "finance-dev-eksdemo1-eks-ng-public"
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
    name           = "finance-dev-eksdemo1-eks-ng-private"
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