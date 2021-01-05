# locals {
#   SUBNET_ID = [aws_subnet.kubernetes-private-1.id, aws_subnet.kubernetes-private-2.id, aws_subnet.kubernetes-private-3.id]
# }

resource "aws_instance" "kube-master" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.MASTER_INSTANCE_TYPE

  tags = {
    Name = "kube-master"
  }

  subnet_id = aws_subnet.kubernetes-private-1.id


  vpc_security_group_ids = [aws_security_group.kubernetes-security-group.id]

  key_name = aws_key_pair.kubernete-key.key_name

  user_data = data.template_cloudinit_config.cloudinit.rendered
}


