# aws-terraform-kubecluster

Run following command to setup custom kubernetes cluster in AWS.

Update the s3 bucket name in s3.tf, scripts/kubernetes-master-node.sh, scripts/kubernetes-worker-node.sh and in kube-destroy.tf

chmod +x kube-setup.sh
./kube-setup.sh
