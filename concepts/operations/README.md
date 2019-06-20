# Operations

Observability, Telemetry, Monitoring and Analysis

Two critical pieces for Operations team are logging and monitoring.

- Logging should include tracing to tie the request routed between multiple services.
- Monitoring should include health checks
- API testing helps to identify deeper issues rather than just health check. Upstream service could be healthy but might have broken API contracts.
  These could be found out if the API tests are run periodically.

| Observability       | Instrumentation                             | Telemetry                                                                    | Monitoring                            |
| ------------------- | ------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------- |
| Logging             | Java Util Logging, Log4J2, Logback          | Fluentd Bit, Logstash Beats, Splunk Universal Forwarder, SumoLogic Collector | EFK, ELK, Splunk, SumoLogic           |
| Distributed Tracing | Spring Cloud Sleuth and Spring Cloud Zipkin | No agent required for Zipkin; Jaeger Client for Jaeger                       | Jaeger (with Zipkin exporter enabled) |
| Health checks       | Spring Boot Actuator (Micrometer)           | No agent is required as Prometheus is pull-based                             | Prometheus and Alertmanager           |
| Metrics             | Spring Boot Actuator (Micrometer)           | No agent is required as Prometheus is pull-based                             | Prometheus and Alertmanager           |

Instrumentation is the way in which metrics are captured. Thermometer (instrument) captures temperature (metric).

## Telemetry

Push and pull are the two data collection methods.

Agent installation is straight-forward in virtual machines.

Agent installation has two options in Kubernetes: DaemonSet and Sidecar.

## References

- <https://cloud.ibm.com/docs/cloud-native?topic=cloud-native-observability-cn>
- <https://www.instana.com/blog/observability-vs-monitoring/>
