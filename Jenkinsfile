pipeline {
    agent any
    parameters {
        string(defaultValue: '', description: 'Ovveride Builds Tag ID', name: 'overrideBuilds')
        string(defaultValue: '', description: 'Ovveride Builds Tag ID', name: 'gitAppID')
        string(defaultValue: '', description: 'Ovveride Builds Tag ID', name: 'gitUserName')
    }
    // Set the next tag version for build to environment variable 
    environment {
        version_num = VersionNumber(projectStartDate: '', versionNumberString: '${BUILDS_ALL_TIME, X}', versionPrefix: 'Version', worstResultForIncrement: 'SUCCESS', overrideBuildsAllTime: "${params.overrideBuilds}")
    }
    stages {
        stage ("Checkout from GIT"){
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'CleanCheckout']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'git@github.com:blackjk83/aquariusengines.git']]
                ])
            }
        }
        stage ("Update the version") {
            steps {
                sh('echo "Current version is $(cat version)"') 
                echo "Updating the version number to ${version_num}"
                sh("echo ${version_num} > version ")
            }
        }
        stage ("Pack new container with latest version") {
            steps {
                echo "Runnin build of new docker container..."
                sh("docker build -t aquarius:latest .")
            }
        }
    }
    post {
        success {
            echo "Registering new container to docker hub"
            sh("docker tag aquarius:latest yakovav/aquarius:latest")
            sh("docker push yakovav/aquarius:latest")               
        }
    }
}
