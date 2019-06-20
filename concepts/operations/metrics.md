# Metrics

Metrics provide quantitative information about processes running inside the system, including counters, gauges, and histograms.

<https://grafana.com/blog/2016/01/05/logs-and-metrics-and-graphs-oh-my/>

## CNCF Projects

- [OpenTelemetry](https://github.com/open-telemetry/opentelemetry-specification): OpenTelemetry makes robust, portable telemetry a built-in feature of cloud-native software.
- [OpenMetrics](https://github.com/OpenObservability/OpenMetrics): OpenMetrics is a working group to determine a standard for exposing metrics data, influenced by the Prometheus exposition format.
- [Prometheus](https://github.com/prometheus/prometheus): Prometheus is a systems and service monitoring system. It collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts if some condition is observed to be true.
- [Cortex](https://github.com/cortexproject/cortex): Cortex provides horizontally scalable, highly available, multi-tenant, long term storage for Prometheus.

## Composition of Metrics Tools

- Instrumentation
- Telemetry / Metrics collector (Prometheus polling, StatsD, Telegraf StatsD)
- Time-series database (Prometheus, InfluxDB, Graphite, OpenTSDB (built on Hadoop and HBase))
- Metrics visualizer (Grafana)
- Alarms notification engine (Prometheues Alertmanager, Grafana Alerts)
  - Notification destinations:
    - [PagerDuty](https://www.pagerduty.com)
    - [Alerta](https://alerta.io)
    - Email
    - IRC
    - [Slack](https://slack.com)
    - [Flock](https://flock.com)
    - [Twilio](https://twilio.com)
    - [MessageBird](https://www.messagebird.com/en/)
    - [Telegram](https://telegram.org)
    - [Pushover](https://pushover.net)
    - [Pushbullet](https://www.pushbullet.com)
    - [Discord](https://discordapp.com)

## Application Performance Monitoring (APM)

Application Performance Monitoring (APM)

Remote Performance Monitoring (RPM)

## Metrics in a Spring Boot Application

- <https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-metrics.html>
