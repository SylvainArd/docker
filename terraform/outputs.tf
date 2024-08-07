output "subnet_ids" {
  value = aws_subnet.public.*.id
}

output "security_group_id" {
  value = aws_security_group.lb_sg.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "region" {
  value = var.aws_region
}
