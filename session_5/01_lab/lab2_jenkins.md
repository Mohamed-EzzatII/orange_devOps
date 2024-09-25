# Jenkins Job Examples

## 1. Jenkins Freestyle Job
Create a Jenkins Freestyle job to pull code from a GitHub repository and build it using Maven.

### Steps:
1. From the Jenkins dashboard, click `New Item`.
2. Select `Freestyle project`.
3. In the `Source Code Management` section, choose `Git` and provide the repository URL.
4. Under the `Build` section, add a step: `Invoke top-level Maven targets`.
5. Set `Goals` to `clean install` to build the project with Maven.
6. Save and run the job.

---

## 2. Declarative Jenkins Pipeline with Maven Build and Unit Tests

```groovy
pipeline { 
  agent any 
  environment { 
    MAVEN_HOME = tool 'Maven' // Reference to Maven installed in Jenkins 
  } 
  stages { 
    stage('Checkout Code') { 
      steps { 
        // Pull the code from GitHub
        git branch: 'main', url: 'https://github.com/username/repository.git' 
      } 
    } 
    stage('Build') { 
      steps { 
        // Run Maven to clean and install the project
        sh "${MAVEN_HOME}/bin/mvn clean install" 
      } 
    } 
    stage('Run Unit Tests') { 
      steps { 
        // Execute Maven unit tests
        sh "${MAVEN_HOME}/bin/mvn test" 
      } 
    } 
  } 
  post { 
    always { 
      // Save test results and build artifacts
      junit 'target/surefire-reports/*.xml' // Path may vary by project structure 
      archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true 
    } 
    failure { 
      // Send a failure notification via email
      mail to: 'team@example.com', 
        subject: "Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}", 
        body: "Build failed. Please check the Jenkins log." 
    } 
  } 
}
```
## 3. Jenkins Pipeline with Slack Notification

```groovy
pipeline { 
  agent any 
  stages { 
    stage('Checkout') { 
      steps { 
        // Clone code from GitHub repository
        git branch: 'main', url: 'https://github.com/username/repo.git' 
      } 
    } 
    stage('Build') { 
      steps { 
        // Build the project using Maven
        sh 'mvn clean install' 
      } 
    } 
    stage('Test') { 
      steps { 
        // Run unit tests
        sh 'mvn test' 
      } 
    } 
  } 
  post { 
    success { 
      // Send success notification via Slack
      slackSend (channel: '#build-notifications',  
        color: 'good',  
        message: "Build SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (<${env.BUILD_URL}|Open>)") 
    } 
    failure { 
      // Send failure notification via Slack
      slackSend (channel: '#build-notifications',  
        color: 'danger',  
        message: "Build FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (<${env.BUILD_URL}|Open>)")
    } 
    always { 
      echo 'Build complete.' 
    } 
  } 
}
```
## 4. Jenkins Pipeline for Kubernetes Deployment

```groovy
pipeline { 
  agent any 
  environment { 
    DOCKER_REGISTRY = 'your-registry-url' 
    IMAGE_NAME = 'your-image-name' 
    KUBERNETES_NAMESPACE = 'your-namespace' 
    KUBE_DEPLOYMENT = 'your-deployment-name' 
    DOCKER_CREDENTIALS = 'docker-credentials-id' // Jenkins credentials for Docker registry
  } 
  stages { 
    stage('Checkout') { 
      steps { 
        // Pull code from the GitHub repository
        git branch: 'main', url: 'https://github.com/username/repo.git' 
      } 
    } 
    stage('Build Docker Image') { 
      steps { 
        script { 
          // Build Docker image
          sh """ 
          docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER} . 
          """ 
        } 
      } 
    } 
    stage('Push to Docker Registry') { 
      steps { 
        script { 
          // Log into Docker registry and push the image
          withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) { 
            sh """ 
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin ${DOCKER_REGISTRY} 
            docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER} 
            """ 
          } 
        } 
      } 
    } 
    stage('Deploy to Kubernetes') { 
      steps { 
        script { 
          // Deploy the new Docker image to Kubernetes
          sh """ 
          kubectl set image deployment/${KUBE_DEPLOYMENT} ${KUBE_DEPLOYMENT}=${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER} --namespace=${KUBERNETES_NAMESPACE} 
          """ 
        } 
      } 
    } 
  } 
  post { 
    success { 
      echo "Deployment succeeded!" 
    } 
    failure { 
      echo "Deployment failed!" 
    } 
  } 
}
```
