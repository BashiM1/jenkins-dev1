# Jenkins Server CI/CD with Terraform Deployments

This repository contains the Infrastructure as Code and Pipeline configurations to automatically provision an AWS S3 bucket via Jenkins and Terraform.

## Project Structure
* `Jenkinsfile`: Declarative pipeline executing Terraform `init`, `plan`, and `apply`.
* `test-bucket.tf`: Terraform configuration deploying an S3 bucket with an S3 state backend.
* `user-data.sh`: Immutable EC2 bootstrap script configuring Jenkins, Java 21, Terraform, and required plugins automatically.
* `trigger.md`: Documentation for the GitHub Webhook configuration.
* `armageddon.md`: Link to my Armageddon project.

## Evidence
Screenshots validating the Webhook (`screenshot-webhook.png`) and successful Terraform Apply (`screenshot-tf-apply.png`) have been uploaded to the `jenkins-gcheck-assets` bucket.