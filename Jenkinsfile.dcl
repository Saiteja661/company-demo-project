pipeline {

    agent any

    stages {

        stage('Checkout') {

            steps {

                echo 'Checking out source code'

                checkout scm

            }

        }

        stage('Build') {

            steps {

                echo 'Build Started'

                sh '''
                    pwd

                    ls -la

                    ls -la Application
                '''

            }

        }

        stage('Test') {

            steps {

                echo 'Testing Application'

                sh '''

                    if [ -f Application/index.html ]
                    then
                        echo "Application Found"

                    else

                        echo "Application Missing"

                        exit 1

                    fi

                '''

            }

        }

        stage('Deploy') {

            steps {

                echo 'Deploying Application'

                sh '''

                    chmod +x deploy.sh

                    ./deploy.sh

                '''

            }

        }

    }

    post {

        success {

            echo 'Deployment Completed Successfully'

        }

        failure {

            echo 'Deployment Failed'

        }

        always {

            echo 'Pipeline Finished'

        }

    }

}