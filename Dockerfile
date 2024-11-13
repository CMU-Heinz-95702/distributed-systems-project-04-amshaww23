FROM tomcat:10.1.13-jdk17

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file
COPY ROOT.war /usr/local/tomcat/webapps/

# Make sure logs directory exists and is writable
RUN mkdir -p /usr/local/tomcat/logs && \
    chmod -R 777 /usr/local/tomcat/logs

# Make webapps directory writable
RUN chmod -R 777 /usr/local/tomcat/webapps

# Set environment variables for debugging
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -XX:+UseContainerSupport"

# Expose port
EXPOSE 8080

# Start Tomcat with console output
CMD ["catalina.sh", "run"]
