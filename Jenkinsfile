pipeline {
    agent any

    
    environment {
       AWS_ACCESS_KEY_ID     = credentials('1eaca009-ced9-4b5c-9849-0ba1ab1ed18d')
       AWS_SECRET_ACCESS_KEY = credentials('a90381e4-8f81-494a-99df-6a80a231f45a')
    }

    stages {
      stage('fetch_latest_code') {
        steps {
        git branch: 'master', url: 'https://github.com/kasturenishant/Jenkins-Terraform.git'
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
