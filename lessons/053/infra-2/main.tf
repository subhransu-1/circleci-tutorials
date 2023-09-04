provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "devopsbyexample-tf-state"
    key    = "platform.tfstate"
    region = "us-east-1"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t3.micro"
  subnet_id     = "subnet-01ac37f7199e021c8"
}
