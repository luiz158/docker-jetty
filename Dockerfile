FROM dockerfile/java:oracle-java7
MAINTAINER Nicholas Iaquinto <nickiaq@gmail.com>

# In case someone loses the Dockerfile
RUN rm -rf /etc/Dockerfile
ADD Dockerfile /etc/Dockerfile

# Install packages
RUN apt-get update && \ 
    apt-get update --fix-missing && \ 
    apt-get install -y wget

# Download and install jetty
RUN wget http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.4.v20141103.tar.gz && \
    tar -xzvf jetty-distribution-9.2.4.v20141103.tar.gz && \
    rm -rf jetty-distribution-9.2.4.v20141103.tar.gz && \
    mv jetty-distribution-9.2.4.v20141103/ /opt/jetty

# Configure Jetty user and clean up install
RUN useradd jetty && \
    chown -R jetty:jetty /opt/jetty && \
    rm -rf /opt/jetty/webapps.demo

# Set defaults for docker run
WORKDIR /opt/jetty
CMD ["java", "-jar", "start.jar", "jetty.home=/opt/jetty"]
