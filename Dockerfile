FROM tomcat:10.1.13-jdk17

# Remove default webapps for security
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file
COPY ROOT.war /usr/local/tomcat/webapps/

# Verify WAR file presence
RUN ls -l /usr/local/tomcat/webapps/

# Add logging configuration
ENV CATALINA_OPTS="-Dorg.apache.catalina.level=INFO"

# Start Tomcat in debug mode
CMD ["catalina.sh", "run"]
