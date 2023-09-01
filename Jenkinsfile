pipeline{
environment {
registry = "scroasdale/lbg-python"
        registryCredentials = "dockerhub_id"
        dockerImage = ""
    }
    agent any
        stages {
            stage ('Build Docker Image'){
                steps{
                    script {
                        dockerImage = docker.build(registry)
                    }
                }
            }

            stage ("Push to Docker Hub"){
                steps {
                    script {
                        docker.withRegistry('', registryCredentials) {
                            dockerImage.push("${env.BUILD_NUMBER}")
                            dockerImage.push("latest")
                        }
                    }
                }
            }

            stage ("Run the image"){
                steps{
                    script{
                        dockerImage.run("-p 3000:8080 --name alpha")
                    }
                }
            }

            stage ("Run the Unit Tests"){
                steps{
                    script{
                        docker exec alpha python lbg.test.py
                    }
                }
            }
            }
        }