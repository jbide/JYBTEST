#!groovy

echo "Debut du script"

node {

 stage ('checkout') {
   checkout scm

 }

 stage ('build') {
   def mvnHome = tool (name: 'MAVBUILD', type: 'maven')
   writeFile (encoding: 'UTF-8', file: 'settings.xml', text: '<settings><localRepository>/tmp</localRepository><servers><server><id>InternalSnapshots</id><username>admin</username><password>admin123</password></server><server><id>InternalReleases</id><username>admin</username><password>admin123</password></server></servers></settings>')
   sh ("${mvnHome}/bin/mvn install -s settings.xml")
   sh('rm settings.xml')
 }

 stage ('finish') {
   archiveArtifacts 'target/*jar'
   echo "fin"
 }
}

node {
  stage ('depoy maven') {
    def buildNum = readfile("buildrelease")
    sh ("${mvnHome}/bin/mvn jgitflow:build-number -DbuildNumber=${buildNum} -s settings.xml")
    sh ("${mvnHome}/bin/mvn deploy -s settings.xml")
    sh('rm settings.xml')
  }

  stage ('declencher deploiement') {
    withCredentials([usernamePassword(credentialsId: 'ansible_cred', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
      // some block
      sh("chmod u+x ./trigger_ansible_tower.sh")
      //sh("./trigger_ansible_tower.sh ${USERNAME} ${PASSWORD} 'JOB_TEST'")
      echo "fin"
     }
  }
}
