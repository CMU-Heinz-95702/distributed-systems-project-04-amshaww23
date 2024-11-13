FROM tomcat:10.1.13-jdk17

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file
COPY ROOT.war /usr/local/tomcat/webapps/

# Make directories writable
RUN mkdir -p /usr/local/tomcat/logs && \
    chmod -R 777 /usr/local/tomcat/logs && \
    chmod -R 777 /usr/local/tomcat/webapps && \
    chmod -R 777 /usr/local/tomcat/work

# Set environment variables
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -XX:+UseContainerSupport"

# Create startup script
RUN echo '#!/bin/bash\n\
catalina.sh run' > /usr/local/tomcat/bin/startup.sh && \
    chmod +x /usr/local/tomcat/bin/startup.sh

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/startup.sh"]
