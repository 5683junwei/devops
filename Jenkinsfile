// 需要在jenkins的Credentials设置中配置jenkins-harbor-creds、jenkins-k8s-config参数
pipeline {
    agent any
    environment {
        HARBOR_CREDS = credentials('jenkins-harbor-creds')
        K8S_CONFIG = credentials('jenkins-k8s-config')
        GIT_TAG = sh(returnStdout: true,script: 'git describe --tags').trim()
    }
    parameters {
        string(name: 'HARBOR_HOST', defaultValue: 'docker.inddbes.com', description: 'harbor仓库地址')
        string(name: 'DOCKER_IMAGE', defaultValue: 'ddbes/devops', description: 'docker镜像名')
        string(name: 'APP_NAME', defaultValue: 'ddbes-devops', description: 'k8s中标签名')
        string(name: 'K8S_NAMESPACE', defaultValue: 'default', description: 'k8s的namespace名称')
    }
    stages {
        stage('Maven Build') {
            when { expression { env.GIT_TAG != null } }
            agent {
                docker {
                    image 'maven:3-jdk-8-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn clean package -Dfile.encoding=UTF-8 -DskipTests=true'
                stash includes: 'target/*.jar', name: 'app'
                sh 'cp target/*.jar /home/junwei/'
            }

        }
    }
}
