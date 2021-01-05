resource "aws_s3_bucket" "kube-cluster-bucket" {
  bucket = "kube-cluster-bucket-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "kube-cluster"
  }
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}

