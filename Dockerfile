FROM openjdk:8

ADD target/*.jar /app.jar
RUN sh -c 'touch /app.jar'
USER root
RUN touch /audit.log && chmod 777 /audit.log

EXPOSE 9080
EXPOSE 9443

CMD java -Djava.net.preferIPv4Stack=true -jar /app.jar