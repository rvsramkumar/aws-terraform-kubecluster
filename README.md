# aws-terraform-kubecluster

## Run following command to setup custom kubernetes cluster in AWS.

```bash
ssh-keygen -f awskey

chmod +x kube-setup.sh
./kube-setup.sh <unique-bucket-name> <worker-node-count>
```
