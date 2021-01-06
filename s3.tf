resource "aws_s3_bucket" "kube-cluster-bucket" {
  bucket = "kube-cluster-bucket-boza1njp64savfskjhusa2"
  acl    = "private"

  tags = {
    Name = "kube-cluster"
  }
}
