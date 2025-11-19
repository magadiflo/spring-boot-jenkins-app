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

## Configurando application.yml

````yml
server:
  port: 8081
  error:
    include-message: always

spring:
  application:
    name: spring-boot-jenkins-app
````

## Endpoint REST básico

````java

@RestController
@RequestMapping(path = "/api/v1/greetings")
public class HelloController {
    @GetMapping
    public ResponseEntity<Map<String, Object>> hello() {
        var response = new HashMap<String, Object>();
        response.put("message", "Hola desde Spring Boot + Jenkins!");
        response.put("timestamp", LocalDateTime.now());
        response.put("version", "1.0.0");
        return ResponseEntity.ok(response);
    }
}
````

## Verificando funcionamiento de endpoints

El endpoint que nosotros creamos.

````bash
$ curl -v http://localhost:8081/api/v1/greetings | jq
>
< HTTP/1.1 200
< Content-Type: application/json
< Transfer-Encoding: chunked
< Date: Wed, 19 Nov 2025 16:21:45 GMT
<
{
  "message": "Hola desde Spring Boot + Jenkins!",
  "version": "1.0.0",
  "timestamp": "2025-11-19T11:21:45.1053065"
}
````

El endpoint que nos proporciona por defecto Actuator.

````bash
$ curl -v http://localhost:8081/actuator/health | jq
>
< HTTP/1.1 200
< Content-Type: application/vnd.spring-boot.actuator.v3+json
< Transfer-Encoding: chunked
< Date: Wed, 19 Nov 2025 16:22:18 GMT
<
{
  "status": "UP"
}
````
