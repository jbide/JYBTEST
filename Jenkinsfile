#!groovy

echo "Debut du script"

node {

 stage ('checkout') {
   checkout scm

 }

 stage ('build') {
   def mvnHome = tool (name: 'MAVBUILD', type: 'maven')
   //writeFile (encoding: 'UTF-8', file: 'settings.xml', text: '<settings><localRepository>E:/APPS/apache-repo-maven</localRepository></settings>')
   //sh ("${mvnHome}/bin/mvn install -s settings.xml")
   sh ("${mvnHome}/bin/mvn install")
 }

 stage ('finish') {
   archiveArtifacts 'target/*jar'
   echo "fin"
 }
}
