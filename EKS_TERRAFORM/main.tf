resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::083211754961:role/all_access_uber" # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0645b8d0abf30a013", "subnet-01a80a7476e6b401e"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0d21f524c627e0b5c"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
ami_id = "ami-068e0f1a600cd311c" 
cluster_name    = aws_eks_cluster.my_cluster.name
instance_types = ["t3.medium"]
node_group_name = "my-_node_group"
  node_role_arn   = "arn:aws:iam::083211754961:role/all_access_uber"  # Replace with your IAM role ARN
Version = "2012-10-17"  
subnet_ids      = ["subnet-0645b8d0abf30a013", "subnet-01a80a7476e6b401e"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
