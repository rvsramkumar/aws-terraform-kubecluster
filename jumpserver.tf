resource "aws_instance" "jump-server" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  tags = {
    Name = "jump-server"
  }

  subnet_id = aws_subnet.kubernetes-public-1.id


  vpc_security_group_ids = [aws_security_group.kubernetes-security-group.id]

  key_name = aws_key_pair.kubernete-key.key_name
}
