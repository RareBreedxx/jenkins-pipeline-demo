pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/rarebreedxx/jenkins-pipeline-demo.git'
            }
        }

        stage('Run System Check Script') {
            steps {
                sh 'chmod +x system_check.sh'
                sh './system_check.sh'
            }
        }

        stage('Verify Log') {
            steps {
                sh '''
                echo "Checking log..."
                if [ -f system_check.log ]; then
                    echo "PASS: Log file exists."
                else
                    echo "FAIL: No log file."
                    exit 1
                fi
                '''
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'system_check.log', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Build SUCCESSFUL — Nice work, Yinka!"
        }
        failure {
            echo "Build FAILED"
        }
    }
}
