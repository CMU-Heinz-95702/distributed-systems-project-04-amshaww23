FROM tomcat:10.1.13-jdk17
COPY ROOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
