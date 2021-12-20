packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
# Vars
variable "app-instance-type" {
  type    = string
  default = "t3.micro"
}
variable "aws-region" {
  type    = string
  default = "us-west-2"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  #base_ami = {{ .SourceAMIName }}
  common_tags = {
    OS      = "Ubuntu"
    Release = "latest"
    Type    = "Demo"
  }
}


# Build
source "amazon-ebs" "ubuntu" {
  ami_name      = "wa-packer-aws-ebs-${local.timestamp}"
  instance_type = "${var.app-instance-type}"
  region        = "${var.aws-region}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags         = local.common_tags
}

build {
  name = "wa-app-build"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    environment_vars = ["ENV_NAME=DEMO"]
    pause_before     = "10s"
    inline = [
      "echo Wellcome to $ENV_NAME",
      "sudo apt update",
      "sudo apt install -y git"
    ]
  }
  provisioner "breakpoint" {
    disable = false
    note    = "Test breakpoint: ${local.timestamp}"
  }
  provisioner "shell" {
    pause_before = "10s"
    script       = "./scripts/app.sh"
  }
}