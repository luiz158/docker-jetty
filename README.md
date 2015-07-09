# Jetty Docker Container

This docker image contains OpenJDK 8 with Jetty 9.3.0 (build 2015-06-12).

## Usage

To serve your web application, simply mount a volume at `/opt/jetty/webapps`. By default, the container will start jetty with `java -jar start.jar jetty.home=/opt/jetty`, where the WORKDIR is /opt/jetty. For example:

```bash
docker run -p 8080:8080 -v /path/to/dir:/opt/jetty/webapps niaquinto/jetty
```

This will start an instance of Jetty serving your WARs out of /path/to/dir on the host. Alternatively, you can (and should!) use a data-only container and `--link data-container-name:data`.

You'll likely also want to either use a `context.xml` file to set the context path to your app, or name your WAR root.war to find you app at `/`
 
Note: If you're using this for just a quick test, or local development, my other image ([niaquinto/docker-gradle on GitHub](http://github.com/niaquinto/docker-gradle) / `docker pull niaquinto/gradle` from the registry) may better suit your needs. You can launch a Jetty instance by including `apply plugin: 'jetty'` in your build.gradle and running `gradle jettyRun`.

## Get the Image

To build this image yourself, run...
 
```bash
docker build github.com/niaquinto/docker-jetty
```

Or, you can pull the image from the central docker repository by using... 
 
```bash
docker pull niaquinto/jetty
```
