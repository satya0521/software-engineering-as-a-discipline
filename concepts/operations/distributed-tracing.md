# Tracing

Tracing, aka distributed tracing, provides insight into the full lifecycles, aka traces, of requests to the system, allowing you to pinpoint failures and performance issues.

## Distributed Tracing in a Spring Application

Spring Cloud Sleuth implements a distributed tracing solution for Spring Cloud.

Data can be captured simply in logs, or by sending it to a remote collector service.

Spring Cloud Sleuth features:

- Adds trace and span ids to the Slf4J MDC, so you can extract all the logs from a given trace or span in a log aggregator.
- Provides an abstraction over common distributed tracing data models: traces, spans (forming a DAG), annotations, key-value annotations. Loosely based on HTrace, but Zipkin (Dapper) compatible.
- Instruments common ingress and egress points from Spring applications (servlet filter, rest template, scheduled actions, message channels, zuul filters, feign client).

## Integration with Exporters

### No Exporter

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-sleuth</artifactId>
            <version>${spring-cloud-sleuth.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-sleuth</artifactId>
    </dependency>
</dependencies>
```

Spring Boot application will generate trace data as long as Spring Cloud Sleuth is on the classpath.

```java
@SpringBootApplication
@RestController
public class Application {

  private static Logger log = LoggerFactory.getLogger(DemoController.class);

  @RequestMapping("/")
  public String home() {
    log.info("Handling home");
    return "Hello World";
  }

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }
}
```

```properties
spring.application.name=my-web-application
```

### Zipkin

If `spring-cloud-sleuth-zipkin` is available then the app will generate and collect Zipkin-compatible traces via HTTP.
By default it sends them to a Zipkin collector service on localhost (port 9411).
Configure the location of the service using `spring.zipkin.baseUrl`.

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-sleuth</artifactId>
            <version>${spring-cloud-sleuth.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-zipkin</artifactId>
    </dependency>
    <!-- enable the follow if you want to use RabbitMQ or Kafka instead of HTTP -->
    <!-- <dependency>
        <groupId>org.springframework.amqp</groupId>
        <artifactId>spring-rabbit</artifactId>
    </dependency> -->
</dependencies>
```

```properties
spring.application.name=my-web-application
spring.sleuth.sampler.probability=0.1 # if zipkin is used
spring.zipkin.baseUrl=http://localhost:9411
spring.zipkin.sender.type=zipkin # kafka and RabbitMQ are other types
```

### Jaeger

Jaeger Collector service exposes Zipkin compatible REST API `/api/v1/spans` and `/api/v2/spans` for both JSON and thrift encoding.
By default it's disabled.
It can be enabled with `--collector.zipkin.http-port=9411`.

Zipkin Thrift IDL file can be found in [jaegertracing/jaeger-idl](https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/zipkincore.thrift).
It's compatible with [openzipkin/zipkin-api](https://github.com/openzipkin/zipkin-api/blob/master/thrift/zipkinCore.thrift).

## References

- <https://content.pivotal.io/springone-platform-2017/distributed-tracing-latency-analysis-for-your-microservices-grzejszczak-krishna>
- <https://spring.io/blog/2016/02/15/distributed-tracing-with-spring-cloud-sleuth-and-spring-cloud-zipkin>
- <https://spring.io/projects/spring-cloud-sleuth>
- <https://cloud.spring.io/spring-cloud-sleuth/single/spring-cloud-sleuth.html>
- <https://github.com/openzipkin/sleuth-webmvc-example>
- <https://github.com/spring-cloud/spring-cloud-sleuth/tree/master/spring-cloud-sleuth-samples>
- <https://www.jaegertracing.io/docs/1.8/getting-started/#migrating-from-zipkin>
