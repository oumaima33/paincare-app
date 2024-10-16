# Use the official Tomcat image as the base image
FROM tomcat:10-jdk11

# Set the CATALINA_HOME environment variable to the Tomcat directory
ENV CATALINA_HOME /usr/local/tomcat

# Copy the WAR file from the current directory (where the Dockerfile is) to the webapps directory of Tomcat
COPY paincare.war $CATALINA_HOME/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
