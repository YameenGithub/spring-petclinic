# Use Maven with Java 17 for the build stage
FROM maven:latest as build
RUN git clone https://github.com/YameenGithub/spring-petclinic.git
WORKDIR /spring-petclinic
RUN mvn package

# jar location /spring-petclinic/target/ spring-petclinic-3.3.0-SNAPSHOT.jar

# Use OpenJDK 17 for the runtime stage
FROM openjdk:17
EXPOSE 8080
COPY --from=build /spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar /spring-petclinic-3.3.0-SNAPSHOT.jar
CMD ["java", "-jar", "/spring-petclinic-3.3.0-SNAPSHOT.jar"]
