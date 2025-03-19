pipeline {
    agent any

    
    environment {
       AWS_ACCESS_KEY_ID     = credentials('AKIATCKASRSI7WWHGF3A')
       AWS_SECRET_ACCESS_KEY = credentials('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')
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
