pipeline {
  agent any
  options { timestamps() }

  stages {

    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Bash Syntax Check') {
      steps {
        sh 'for f in scripts/*.sh; do bash -n $f; done'
      }
    }

    stage('ShellCheck') {
      steps {
        sh 'shellcheck scripts/*.sh'
      }
    }

    stage('Permission Check') {
      steps {
        sh 'for f in scripts/*.sh tests/*.sh; do [ -x $f ] || exit 1; done'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'tests/test_system_health.sh'
      }
    }
  }

  post {
    success { echo 'CI PASSED ' }
    failure { echo 'CI FAILED ' }
  }
}

