variable "AWS_REGION" {
  default = "us-east-2"
}
variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "PRIVATE_KEY" {
  default = "awskey"
}

variable "PUBLIC_KEY" {
  default = "awskey.pub"
}

variable "KUBE_INTERNAL_PORTS" {
  default = [2379, 2380, 10250, 10251, 10252]
}

variable "KUBE_API_PORT" {
  default = 6443
}

variable "NODE_PORT" {
  default = {
    FROM = 30000
    TO   = 32767
  }
}

variable "EXTERNAL_PORTS" {
  default = [80, 443, 22]
}

