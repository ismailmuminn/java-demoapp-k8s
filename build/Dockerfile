#
# Compile, build and package as single 'fat' JAR with Maven
#
FROM adoptopenjdk/openjdk16:alpine AS build

ARG APP_VERSION=2.1.7

LABEL Name="Java SpringBoot Demo App" Version=$APP_VERSION
LABEL org.opencontainers.image.source="https://github.com/benc-uk/java-demoapp"

WORKDIR /build

# mvnw dosyasını ve .mvn klasörünü kopyala
COPY mvnw .
COPY .mvn .mvn

# pom.xml ve src klasörünü kopyala
COPY pom.xml .
COPY src ./src

# mvnw çalıştırılabilir yap
RUN chmod +x ./mvnw

# Maven build işlemi
RUN ./mvnw -ntp clean package -Dapp.version=$APP_VERSION -DskipTests -Dmaven.test.skip=true -Dcheckstyle.skip=true

# Çıkan jar dosyasını target içinde kısaltılmış isimle tut
RUN mv target/java-demoapp-${APP_VERSION}.jar target/java-demoapp.jar


#
# Runtime image (JRE + jar)
#
FROM adoptopenjdk/openjdk16:alpine-jre

WORKDIR /app

COPY --from=build /build/target/java-demoapp.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "java-demoapp.jar"]
