resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::083211754961:role/clone-ec2" # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0645b8d0abf30a013", "subnet-01a80a7476e6b401e"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0afdc26a26f35d530"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::083211754961:role/clone-ec2"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-0645b8d0abf30a013", "subnet-01a80a7476e6b401e"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
