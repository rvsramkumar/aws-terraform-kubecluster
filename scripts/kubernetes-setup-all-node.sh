#!/bin/bash
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

cat <<EOF | sudo tee /etc/default/kubelet
KUBELET_EXTRA_ARGS=--cloud-provider=aws
EOF

HOSTNAME=`curl http://169.254.169.254/latest/meta-data/local-hostname`
sudo hostnamectl set-hostname $HOSTNAME