terraform {
  cloud {
    organization = "mleager"
    workspaces {
      name = "aws-vpc"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

