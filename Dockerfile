# Stage 1: Build con Maven 3.9.11 + Java 21
FROM maven:3.9.11-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime con JRE 21
FROM eclipse-temurin:21-jre-alpine AS runtime
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8081

# Usar ENTRYPOINT para inmutabilidad
ENTRYPOINT ["java", "-jar", "app.jar"]
