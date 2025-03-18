pipeline {
    agent any

    
    environment {
       AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
       AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
      stage('fetch_latest_code') {
        steps {
        git branch: 'master', url: 'https://github.com/snehabopche/Jenkins-Terraform.git'
 }
      }
    
      stage('TF Init&Plan') {
        steps {
          sh 'terraform init'
          sh 'terraform plan'
          }
      }
      
      stage('Approval') {
            steps {
                script {
                    def userInput = input(
                        id: 'Approval', message: 'Approve the deployment?', 
                        parameters: [choice(name: 'Deploy', choices: 'Yes\nNo', description: 'Do you want to deploy?')]
                    )

                    if (userInput == 'No') {
                        error 'Deployment aborted by the user'
                    }
                }
            }
        }
       stage('TF Apply') {
        steps {
          sh 'terraform apply -auto-approve'
        }      
    } 
  }
}
