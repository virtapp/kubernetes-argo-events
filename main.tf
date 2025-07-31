
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

resource "null_resource" "install_k3s" {
  provisioner "local-exec" {
    command = "export K3S_EXEC_FLAGS='--disable=traefik --disable=local-storage' && bash ./modules/k3s/install_k3s.sh ${var.node_role} ${var.k3s_version}"
    #command = "bash ./modules/k3s/install_k3s.sh ${var.node_role} ${var.disable_components} ${var.k3s_version}"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

