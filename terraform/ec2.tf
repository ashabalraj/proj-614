# Create three EC2 instaces for Bastion, Jenkins and App

resource "aws_instance" "bastion-614" {
ami = "ami-0e2c8caa4b6378d8c"
instance_type = "t2.micro"
subnet_id = aws_subnet.publicsubnet1-614.id
key_name = "ab"
vpc_security_group_ids = [aws_security_group.sgbastion-614.id]

tags = {
Name = "bastion-614"
}
}

resource "aws_instance" "jenkins-614" {
ami = "ami-0e2c8caa4b6378d8c"
instance_type = "t2.micro"
subnet_id = aws_subnet.privatesubnet1-614.id
key_name = "ab"
vpc_security_group_ids = [aws_security_group.sgjenkins-614.id]

tags = {
Name = "jenkins-614"
Managed = "Ansible"
}
}

resource "aws_instance" "app-614" {
ami = "ami-0e2c8caa4b6378d8c"
instance_type = "t2.micro"
subnet_id = aws_subnet.privatesubnet2-614.id
key_name = "ab"
vpc_security_group_ids = [aws_security_group.sgapp-614.id]

tags = {
Name = "app-614"
Managed = "Ansible"
}
}
