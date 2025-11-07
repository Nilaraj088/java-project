

# STEP 1: Build the project using Maven
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app
COPY . .
#RUN ./mvnw clean package -DskipTests

# STEP 2: Run the built JAR
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar ./app.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "app.jar"]
