FROM tomcat:9
ADD addressbook.war /var/lib/jenkins/workspace/Cicd-project/target
CMD ["catalina.sh", "run"]
EXPOSE 8080
