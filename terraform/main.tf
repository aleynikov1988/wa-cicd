terraform {
  backend "http" {
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  monitoring    = true
  ebs_optimized = true
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  tags = {
    Name = "Hello WA"
  }
}


// module "ec2_instance" {
//   source  = "terraform-aws-modules/ec2-instance/aws"
//   version = "~> 3.0"

//   name = "single-instance"

//   ami                    = "ami-ebd02392"
//   instance_type          = "t3.micro"
//   key_name               = "user1"
//   monitoring             = true
//   vpc_security_group_ids = ["sg-12345678"]
//   subnet_id              = "subnet-eddcdzz4"

//   tags = {
//     Terraform   = "true"
//     Environment = "dev"
//   }
// }