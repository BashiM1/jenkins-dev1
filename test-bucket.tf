terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
  }

  backend "s3" {
    bucket  = "terraform-state-bash"               
    key     = "jenkins-test-032826.tfstate"        
    region  = "us-east-1"                          
    encrypt = true                                 
  } 
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true
  
  tags = {
    Name = "Jenkins Bucket - Bash Deployment"
  }
}