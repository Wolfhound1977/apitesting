pipeline {
    agent any
    stages {
      stage('Initialize'){
        steps{
          echo '====Start api===='
          sh 'java -Dserver.port=8900 -jar resources/AppPerformanceTest-0.1-SNAPSHOT.jar &'
        }
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
                step([$class: 'JUnitResultArchiver', testResults: '**/reports/junit/*.xml', healthScaleFactor: 1.0])
                    publishHTML (target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: false,
                    keepAll: true,
                    reportDir: 'coverage',
                    reportFiles: 'index.html',
                    reportName: "Junit Report"
                ])
            }
            }
          }
        }
      }
    }
}
