# GitHub Webhook Trigger for Jenkins

## Configuration
1. **Payload URL:** `http://<EC2-PUBLIC-IP>:8080/github-webhook/`
2. **Content type:** `application/json`
3. **Events:** `push`

## Evidence of Trigger
A push event was sent to the repository, successfully triggering the Jenkins pipeline. 

Please see the `screenshot-webhook.png` uploaded to the `jenkins-gcheck-assets` S3 bucket for the `200 OK` delivery confirmation from the GitHub Webhooks payload delivery page.