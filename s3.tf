resource "aws_s3_bucket" "kube-cluster-bucket" {
  bucket = var.S3_BUCKET
  acl    = "private"

  tags = {
    Name = "kube-cluster"
  }
}

resource "null_resource" "kube-cluster-bucket" {
  provisioner "local-exec" {
    command = "echo ${aws_s3_bucket.kube-cluster-bucket.id} > s3_bucket_name.txt"
  }
}
