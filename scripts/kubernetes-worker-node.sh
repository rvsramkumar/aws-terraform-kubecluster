#!/bin/bash
file_exist=`aws s3 ls s3://kube-cluster-bucket-boza1njp64savfskjhusa2/join-config.yaml`
while [[-z ${file_exist}]]; do
  sleep 30
  file_exist=`aws s3 ls s3://kube-cluster-bucket-boza1njp64savfskjhusa2/join-config.yaml`
done
aws s3 cp s3://kube-cluster-bucket-boza1njp64savfskjhusa2/join-config.yaml join-config.yaml

HOSTNAME=`hostname`

sed -i "s/HOSTNAME/${HOSTNAME}/g" join-config.yaml

sudo cp join-config.yaml /etc/kubernetes/node.yaml

sudo kubeadm join --config /etc/kubernetes/node.yaml