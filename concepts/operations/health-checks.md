# Spring Boot Actuator

## Dependency

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

## Endpoints

- `/health`: unauthenticated request will only have a response of service status; authenticated traffic will provide sensitive info
- `/info`: is not a sensitive endpoint; displays arbitary application info
- `/metrics`: sensitive by default
- `/trace`: displays the trace for last few HTTP requests

## Checking the health of downstream services

```java
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;

public class DownstreamHealthIndicator implements HealthIndicator {

    private RestTemplate restTemplate;

    private String downStreamUrl;

    @Autowired
    public DownstreamHealthIndicator(RestTemplate restTemplate, String downStreamUrl) {
        this.restTemplate = restTemplate;
        this.downStreamUrl = downStreamUrl;
    }

    @Override
    public Health health() {
        try {
            JsonNode resp = restTemplate.getForObject(downStreamUrl + "/health", JsonNode.class);
            if (resp.get("status").asText().equalsIgnoreCase("UP")) {
                return Health.up().build();
            }
        } catch (Exception exception) {
            return Health.down(exception).build();
        }
        return Health.down().build();
    }
}
```

## Questions

- How to secure the actuator endpoints?

## References

- <https://www.baeldung.com/spring-boot-actuators>
- <https://stackoverflow.com/a/37658528>
