terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }

      tls = {
      source  = "hashicorp/tls"    # 👈 generates the private key
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"  # 👈 saves .pem file to disk
      version = "~> 2.0"
    }
  }
# Remote Backend
  backend "s3" {
    bucket         = "transit-gateway-339713166619-us-east-1-an"
    key            = "vpc/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }   
}

provider "aws" {
    alias="us-east"
  region = var.aws_region
}


provider "aws" {
    alias="us-east2"
    region=var.aws_region_2
}