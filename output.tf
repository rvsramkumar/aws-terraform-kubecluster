
output "master-ip" {
  value = aws_instance.kube-master.private_ip
}

output "worker-ip" {
  value = aws_instance.kube-worker[*].private_ip
}

output "jump-server" {
  value = aws_instance.jump-server.public_ip
}
