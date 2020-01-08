pipeline {
    agent any
    stages {
      stage ('Build') {
        steps {
          echo '====Maven compile step===='
          sh 'mvn compile'
        }
      }
      stage ('Test') {
        steps {
          echo '====Run tests===='
             sh  'mvn surefire:test -f pom.xml'
          post {
            always {
                junit '**/reports/junit/*.xml'
            }
            }
          }
        }
      }
    }
}
