#!/usr/bin/env groovy

node ("Jenkis"){
    echo "Hello, World"
    stage('checkout'){
      checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'Git-credentials', url: 'https://github.com/GitRonald2023/terraformV.2.git']])
    }
    stage('Build') {
        echo "Build Gradle App"
    }
    sh "ls"
}
