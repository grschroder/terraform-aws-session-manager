resource "aws_security_group" "allow-icmp" {
  name        = "allow-icmp"
  description = "Allow ICMP inbound traffic"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "Allow ICMP from ALL" 
    to_port          = 0
    from_port        = 8
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 8
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-icmp"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "SSH from ALL"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}