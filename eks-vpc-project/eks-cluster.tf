module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 20.31"

    cluster_name = local.cluster_name
    cluster_version = var.kubernetes_version

    # Optional
    cluster_endpoint_public_access = true
    enable_irsa = true
    # Optional: Adds the current caller identity as an administrator via cluster access entry
    enable_cluster_creator_admin_permissions = true

    cluster_compute_config = {
        enabled = true
        node_pools = ["general-purpose"]
    }

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    eks_managed_node_group_defaults = {
        ami_type = "AL2_x86_64"
        instance_types = ["t2.micro"]
        vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
    }

    eks_managed_node_groups = {
        node_group = {
            min_size     = 2
            max_size     = 4
            desired_size = 2
        }
    }

    tags = {
        Environment = "dev"
        Terraform = "true"
        cluster = "demo"
    }
}