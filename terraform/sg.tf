# sg.tf

# Bastion Server Security Group

resource "aws_security_group" "sgbastion-614" {
  name        = "sgbastion-614"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-614.id

  tags = {
    Name = "sgbastion-614"
  }
}

resource "aws_vpc_security_group_ingress_rule" "bastionallin-614" {
  security_group_id = aws_security_group.sgbastion-614.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "bastionallin-614"
  }
}

resource "aws_vpc_security_group_egress_rule" "bastionallout-614" {
  security_group_id = aws_security_group.sgbastion-614.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "bastionallout-614"
  }
}

# Jenkins Server Security Group

resource "aws_security_group" "sgjenkins-614" {
  name        = "sgjenkins-614"
  description = "Allow inbound from VPC and all outbound traffic"
  vpc_id      = aws_vpc.vpc-614.id

  tags = {
    Name = "sgjenkins-614"
  }
}

resource "aws_vpc_security_group_ingress_rule" "jenkinsin-614" {
  security_group_id = aws_security_group.sgjenkins-614.id
  cidr_ipv4         = "10.0.0.0/16"
  ip_protocol       = "-1"

  tags = {
    Name = "jenkinsin-614"
  }
}

resource "aws_vpc_security_group_egress_rule" "jenkinsout-614" {
  security_group_id = aws_security_group.sgjenkins-614.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "jenkinsout-614"
  }
}

# App Server Security Group

resource "aws_security_group" "sgapp-614" {
  name        = "sgapp-614"
  description = "Allow all from VPC and all outbound traffic"
  vpc_id      = aws_vpc.vpc-614.id

  tags = {
    Name = "sgapp-614"
  }
}

resource "aws_vpc_security_group_ingress_rule" "appin-614" {
  security_group_id = aws_security_group.sgapp-614.id
  cidr_ipv4         = "10.0.0.0/16"
  ip_protocol       = "-1"

  tags = {
    Name = "appin-614"
  }
}

resource "aws_vpc_security_group_egress_rule" "appout-614" {
  security_group_id = aws_security_group.sgapp-614.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "appout-614"
  }
}
