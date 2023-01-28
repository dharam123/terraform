terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"  
    }
null = {
      source = "hashicorp/null"
      version = "~> 3.0" 
}
 }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  access_key = "AKIA3FPKTM2ANU3EHI6L"
  secret_key = "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"
}

terraform {
backend "s3" {
bucket = "mytfstatefile3011"
key = "stateF/terraform.tfstate"
region = "us-east-1"
}
}
