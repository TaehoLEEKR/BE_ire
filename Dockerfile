FROM openjdk:11-jre

ENV APP_HOME=/usr/app/

WORKDIR $APP_HOME

COPY build/libs/*.jar $APP_HOME/application.jar

EXPOSE 8080

ENV DATABASE_URL=jdbc:mariadb://mariadb/camping

CMD ["java", "-jar", "-Dspring.profiles.active=prod", "application.jar"]
