# Use the Maven base image with JDK
FROM maven:3.8-jdk-11 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Run Maven to build the project
RUN mvn clean package

# Create a new stage for the final application image
FROM openjdk:11-jre

# Set the working directory for the new stage
WORKDIR /app

# Copy the built artifact (e.g., JAR, WAR) from the builder stage to the final stage
COPY --from=builder /app/target/*.war .

# Expose the desired port for the application
EXPOSE 8080

# Set the command to run your application (adjust if needed)
CMD ["java", "-jar", "addressbook.war"]
