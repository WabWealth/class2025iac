pipeline {
    agent any 


    parameters {
        choice (
            name: 'TF_ACTION',
            choices :['plan','apply', 'destroy'],
            description: 'Select which Terraform action to run'
        )
    }
    
    stages {
        stage ('checkout') {
            steps {
                checkout scm
            }
        }
        stage ('terraform init') {
            steps {
                dir ('terraform') {
                    sh ' terraform init -reconfigure'
                }
            }
        }

        stage ('terraform validate') {
            steps {
                dir ('terraform') {
                    sh ' terraform validate'
                }
            }
        } 
        
        stage ('terraform plan') {
            when  {
                expression { params.TF_ACTION == 'plan'}
            }
            steps {
                dir ('terraform') {
                    sh ' terraform plan'
                }
            }
        } 

        stage ('terraform apply') {
         when  {
                expression { params.TF_ACTION == 'apply'}
            }
            steps {
                dir ('terraform') {
                    sh ' terraform apply -auto-approve'
                }
            }
        } 

        stage ('terraform destroy') {
         when  {
                expression { params.TF_ACTION == 'destroy'}
            }
            steps {
                dir ('terraform') {
                    sh ' terraform destroy -auto-approve'
                }
            }
        } 
    
    }
}
