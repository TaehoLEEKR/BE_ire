FROM openjdk:11-jre

ENV APP_HOME=/usr/app/

WORKDIR $APP_HOME

COPY build/libs/*.jar application.jar

EXPOSE 8080

WORKDIR /home/gradle/project

COPY . .

RUN echo "systemProp.http.proxyHost=krmp-proxy.9rum.cc\nsystemProp.http.proxyPort=3128\nsystemProp.https.proxyHost=krmp-proxy.9rum.cc\nsystemProp.https.proxyPort=3128" > /root/.gradle/gradle.properties

RUN gradle wrapper

RUN ./gradlew clean build

ENV DATABASE_URL=jdbc:mariadb://mariadb/camping

CMD ["java", "-jar", "-Dspring.profiles.active=prod", "application.jar" ]