resource "aws_key_pair" "kubernete-key" {
  key_name   = "kubernete-key"
  public_key = file(var.PUBLIC_KEY)
}
