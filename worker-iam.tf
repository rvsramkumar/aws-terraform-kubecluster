resource "aws_iam_role" "k8s-cluster-iam-worker-role" {
  name               = "k8s-cluster-iam-worker-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "k8s-cluster-iam-worker-role-instanceprofile" {
  name = "k8s-cluster-iam-worker-role"
  role = aws_iam_role.k8s-cluster-iam-worker-role.name
}

resource "aws_iam_role_policy" "k8s-cluster-iam-worker-policy" {
  name   = "k8s-cluster-iam-worker-policy"
  role   = aws_iam_role.k8s-cluster-iam-worker-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeRegions",
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:BatchGetImage"
            ],
            "Resource": "*"
        },
        {
         "Effect":"Allow",
         "Action":[
            "s3:ListBucket"
         ],
         "Resource":"${aws_s3_bucket.kube-cluster-bucket.arn}"
      },
      {
         "Effect":"Allow",
         "Action":[
            "s3:PutObject",
            "s3:GetObject"
         ],
         "Resource":"${aws_s3_bucket.kube-cluster-bucket.arn}/*"
      }
    ]
}
EOF

}
