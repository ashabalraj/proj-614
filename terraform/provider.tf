terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }

  backend "s3" {
    bucket = "tfstore-614"
    key    = "states/terraform.tfstate"
    region = "us-east-1"
}
}
