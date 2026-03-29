# Jenkins Server CI/CD with Terraform Deployments

This repository contains the Infrastructure as Code and Pipeline configurations to automatically provision an AWS S3 bucket via Jenkins and Terraform.

## Project Structure
* `Jenkinsfile`: Declarative pipeline executing Terraform `init`, `plan`, and `apply`.
* `test-bucket.tf`: Terraform configuration deploying an S3 bucket with an S3 state backend.
* `user-data.sh`: Immutable EC2 bootstrap script configuring Jenkins, Java 21, Terraform, and required plugins automatically.
* `trigger.md`: Documentation for the GitHub Webhook configuration.
* `armageddon.md`: Link to my Armageddon project.

## Evidence
Screenshots validating the Webhook (`screenshot-webhook.png`) and successful Terraform Apply (`screenshot-tf-apply.png`) and the other evidence objects below have been uploaded to the `jenkins-gcheck-assets` bucket.

https://jenkins-gcheck-assets.s3.us-east-1.amazonaws.com/screenshot-tf-apply.png
https://jenkins-gcheck-assets.s3.us-east-1.amazonaws.com/screenshot-webhook.png
https://jenkins-gcheck-assets.s3.us-east-1.amazonaws.com/theopassconfirmationarmageddon.png
https://jenkins-gcheck-assets.s3.us-east-1.amazonaws.com/terraformplanoutproof.png
https://jenkins-gcheck-assets.s3.us-east-1.amazonaws.com/webhook-evidence-trigger.png