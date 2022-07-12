terraform {
  required_version = ">= 0.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.14"
    }
  }
}


provider "aws" {
  region = "us-east-1"

}