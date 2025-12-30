terraform {
  required_providers {
    aws = {
        source = "hashicrop/aws"
        version = "6.27.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}