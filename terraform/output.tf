#output file to show public and private subnets created, public IP's of EC2 instances 

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = [aws_subnet.publicsubnet1-614.id, aws_subnet.publicsubnet2-614.id]
}

output "vpc_private_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = [aws_subnet.privatesubnet1-614.id, aws_subnet.privatesubnet2-614.id]
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = [aws_instance.bastion-614.public_ip] 
}

output "ec2_instance_private_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = [aws_instance.bastion-614.private_ip, aws_instance.jenkins-614.private_ip, aws_instance.app-614.private_ip ] 
}

output "ALB_DNS" {
  description = "DNS of Load Balancer"
  value       = [aws_lb.lb-614.DNS]
}
