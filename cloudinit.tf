data "template_file" "init-script" {
  template = file("scripts/init.cfg")
  vars = {
    REGION = var.AWS_REGION
  }
}

data "template_file" "shell-script1" {
  template = file("scripts/kubernetes-setup-all-node.sh")
}

data "template_file" "shell-script-master" {
  template = file("scripts/kubernetes-master-node.sh")
}

data "template_file" "shell-script-worker" {
  template = file("scripts/kubernetes-worker-node.sh")
}

data "template_cloudinit_config" "master-cloudinit" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.init-script.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script1.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script-master.rendered
  }
}


data "template_cloudinit_config" "worker-cloudinit" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.init-script.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script1.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script-worker.rendered
  }

}
