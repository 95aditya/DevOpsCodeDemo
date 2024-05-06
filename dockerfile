FROM maven:3.8-jdk-11 AS builder

WORKDIR /app

COPY . /app

RUN mvn clean package
