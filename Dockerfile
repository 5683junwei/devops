# service
FROM openjdk:8-jre

# service scripts
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN mkdir /ddbes
COPY target/devops-0.0.1-SNAPSHOT.jar /ddbes
WORKDIR /ddbes
#ceshi
#EXPOSE 8305
EXPOSE 9002

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/ddbes/devops-0.0.1-SNAPSHOT.jar"]
