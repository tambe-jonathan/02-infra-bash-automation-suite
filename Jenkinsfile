pipeline {
  agent any
  options { timestamps() }

  stages {

    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Bash Syntax Check') {
      steps {
        sh 'find scripts/ -name "*.sh" -exec bash -n {} +'
      }
    }

    stage('ShellCheck') {
      steps {
        sh 'find scripts/ -name "*.sh" -exec shellcheck {} +'
      }
    }

    stage('Permission Check') {
      steps {
        sh 'find scripts/ -name "*.sh" -exec chmod +x {} +'
        sh 'find scripts/ -name "*.sh" -exec ls -l {} +'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'find tests/ -name "*.sh" -exec bash {} +'
      }
    }
  }

  post {
    success { echo 'CI PASSED ' }
    failure { echo 'CI FAILED ' }
  }
}

