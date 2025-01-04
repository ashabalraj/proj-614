#ALB - All components - Two load balancers, one sercurity group, one target group for app server and one target group for jenkins server. 

resource "aws_security_group" "sglb-614" {
  name   = "sglb-614"
  vpc_id = aws_vpc.vpc-614.id

  // Inbound rule for port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rule for all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sglb-614"
  }
}

resource "aws_lb" "lbapp-614" {
  name               = "lbapp-614"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sglb-614.id]
  subnets            = [aws_subnet.publicsubnet1-614.id, aws_subnet.publicsubnet2-614.id]
}

resource "aws_lb" "lbjenkins-614" {
  name               = "lbjenkins-614"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sglb-614.id]
  subnets            = [aws_subnet.publicsubnet1-614.id, aws_subnet.publicsubnet2-614.id]
}


resource "aws_lb_listener" "lblistapp-614" {
  load_balancer_arn = aws_lb.lbapp-614.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lbtgapp-614.arn
  }
}

resource "aws_lb_listener" "lblistjenkins-614" {
  load_balancer_arn = aws_lb.lbjenkins-614.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lbtgjenkins-614.arn
  }
}

resource "aws_lb_target_group" "lbtgjenkins-614" {
  name     = "lbtgjenkins-614"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-614.id
}

resource "aws_lb_target_group" "lbtgapp-614" {
  name     = "lbtgapp-614"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-614.id
}

resource "aws_lb_target_group_attachment" "lbtgattachapp-614" {
  target_group_arn = aws_lb_target_group.lbtgapp-614.arn
  target_id        = aws_instance.app-614.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "lbtgattachjenkins-614" {
  target_group_arn = aws_lb_target_group.lbtgjenkins-614.arn
  target_id        = aws_instance.jenkins-614.id
  port             = 8080
