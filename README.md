# Proyecto para la sección 09 del curso de Jenkins

Este proyecto implementa un endpoint simple, solo requerimos este proyecto en Spring Boot para ver cómo es que
Jenkins lo descarga, lo empaqueta. lo convierte a imagen Docker y lo sube a Docker Hub.

## Dependencias

El proyecto se creó desde
[Spring initializr](https://start.spring.io/#!type=maven-project&language=java&platformVersion=3.5.7&packaging=jar&configurationFileFormat=yaml&jvmVersion=21&groupId=dev.magadiflo&artifactId=spring-boot-jenkins-app&name=spring-boot-jenkins-app&description=Demo%20project%20for%20Spring%20Boot&packageName=dev.magadiflo.app&dependencies=web,lombok,actuator).

````xml
<!--Spring Boot 3.5.7-->
<!--Java 21-->
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

    <dependency>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <optional>true</optional>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
````
