resource "aws_instance" "ec2-serverclient" {
  ami                  = data.aws_ami.ami-ubuntu22-server.id
  instance_type        = "t2.micro"
  key_name             = var.SSH_KEY_NAME
  subnet_id            = var.AWS_SUBNET_ID
  iam_instance_profile = aws_iam_instance_profile.role-ec2-instance-profile.name

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow-icmp.id
  ]

  tags = {
    Name = "ServerClient"
  }
  

}