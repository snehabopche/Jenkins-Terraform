# Jenkins-Terraform

## Assumptions
* Jenkins server as CICD tool installed and running.
* Terraform plugin installed and configured.
* AWS credentials saved as secret text in Jenkins credential manager so can be used as environment variable
* keypair available to create EC2 instnaces. 

## Jenkins
* created TerraformJOB pipeline
* added git [repo](https://github.com/kasturenishant/Jenkins-Terraform) 
* Build the pipeline
* it should create the 
* * 2 EC2 instances 
* * security group 
* * s3 bucket to serve as backend for statefile
* * Dynammodb table to secure lock

## Github congifurations
* created webhook with this [repo](https://github.com/kasturenishant/Jenkins-Terraform)
* so every time with new commit it should build the pipeline

## Code in GitHub explanation
* Jenkinsfile: it will use crednetial of AWS and create infrastructre using terraform scripts.
* main.tf, security-group.tf, variable.tf : terrafrom scripts
* terraform statefile will be saved in s3, and user lock will be saved in dynamodb so only one user can work at a time.
