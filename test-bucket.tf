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
  region = "us-east-1"
}

locals {
  evidence_files = {
    "armageddon.txt"                     = "text/plain"
    "s3_bucket_created.png"              = "image/png"
    "screenshot-tf-apply.png"            = "image/png"
    "screenshot-webhook.png"             = "image/png"
    "terraformplanoutproof.png"          = "image/png"
    "theopassconfirmationarmageddon.png" = "image/png"
  }
}

resource "aws_s3_object" "submission_evidence" {
  for_each = local.evidence_files

  bucket       = "jenkins-gcheck-assets"
  key          = each.key
  source       = "${path.module}/evidence/${each.key}"
  content_type = each.value
  source_hash  = filemd5("${path.module}/evidence/${each.key}")
}

resource "aws_s3_bucket_public_access_block" "assets_access" {
  bucket = "jenkins-gcheck-assets"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "assets_read_policy" {
  depends_on = [aws_s3_bucket_public_access_block.assets_access]
  bucket     = "jenkins-gcheck-assets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::jenkins-gcheck-assets/*"
      }
    ]
  })
}

resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true

  tags = {
    Name = "Jenkins Deployment Proof"
  }
}